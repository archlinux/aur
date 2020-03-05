# Maintainer: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: yochananmarqos
# Contributor: matthias.lisin
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.27.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
makedepends=('go-pie>=1.13')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('e2406f5f1572d293170ff6f17a1a0799b1cd1ab80f548dbccc28e8e1b4a7b451')

build() {
    export GOPROXY="https://gocenter.io"

    cd wtf-$pkgver
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o $pkgname .
}

package(){
    cd wtf-$pkgver
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
