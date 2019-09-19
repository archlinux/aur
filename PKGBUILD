# Maintainer: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: yochananmarqos
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.22.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('b421af6aceba9b4f4ff67d591fd899e5357891a06fa13704ec4e77f983ee1064')

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
