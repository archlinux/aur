# Maintainer: sprobie <sprobie1@gmail.com>
pkgname=mkbrr
pkgver=1.19.0
pkgrel=1
pkgdesc='A tool to create, modify and inspect torrent files'
arch=('x86_64' 'aarch64' 'armv')
url='https://github.com/autobrr/mkbrr'
license=('GPL-2.0')
makedepends=('go')
provides=('mkbrr')
conflicts=('mkbrr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/autobrr/mkbrr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e583a17cc2d7fa9384c42a269349474bf4441cbb5d3f701de36cd9fd7752255')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd $pkgname-$pkgver
    go build -ldflags "-X main.version=${pkgver}" 
}

package() {
    install -Dm755 "$pkgname-$pkgver/mkbrr" "$pkgdir/usr/bin/mkbrr"
}
