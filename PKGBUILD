# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr
pkgver=1.15.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64' 'aarch64' 'armv')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
makedepends=('go')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/autobrr/mkbrr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b240208f39ae134897448a8deee686c9ecbf84be6171a3b6418248ebb632e61')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd $pkgname-$pkgver
    go build -ldflags "-X main.version=${pkgver}" 
}

check() {
    make -C $pkgname-$pkgver test
}

package() {
    install -Dm755 "$pkgname-$pkgver/mkbrr" "$pkgdir/usr/bin/mkbrr"
}
