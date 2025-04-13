# Maintainer: sprobie <sprobie1@gmail.com>
_pkgname=mkbrr
pkgname=mkbrr-git
pkgver=1.8.0.r0.g1f78ae4
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64' 'aarch64' 'armv')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
makedepends=('go')
provides=('mkbrr')
conflicts=('mkbrr')
source=("git+https://github.com/autobrr/$_pkgname.git")
sha256sums=('SKIP')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd $_pkgname
    go build -ldflags "-X main.version=${pkgver}" 
}

check() {
    make -C $_pkgname test
}

package() {
    install -Dm755 "$_pkgname/mkbrr" "$pkgdir/usr/bin/mkbrr"
}

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
