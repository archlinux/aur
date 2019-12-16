# Maintainer: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: yochananmarqos
# Contributor: matthias.lisin
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.25.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
makedepends=('go-pie>=1.13')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('0b461eba9b423db401e254507f5b83b85e089842290dd0fb574df2575d5409b6')

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
