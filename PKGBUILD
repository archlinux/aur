# Maintainer: Will Price <will.price94@gmail.com>

pkgname=mylg-git
pkgver=v0.2.2.r8.g39cf628
pkgrel=2
pkgdesc="General Network diagnostic tool"
arch=('any')
url="mylg.io"
license=('MIT')
depends=()
makedepends=('')
options=('!strip')
source=('git+https://github.com/mehrdadrad/mylg.git')
md5sums=('SKIP')
depends=('libpcap')
makedepends=('go')
conflicts=('mylg-bin' 'mylg')
provides=('mylg')

pkgver() {
    cd "${pkgname%%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export GOPATH="$srcdir"
    export GOBIN="${srcdir}/bin"

    cd "$srcdir/mylg"
    go get -v
    go build mylg.go
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install "$srcdir/mylg/mylg" "$pkgdir/usr/bin/"
}
