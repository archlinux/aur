# Maintainer: Kaio "yaakushi" Augusto <kaioaugusto dot 8 at gmail dot com>
# Contributor: yochananmarqos
# Contributor: matthias.lisin
# Contributor: Bruno Inec <bruno at inec dot fr>

pkgname=wtfutil
pkgver=0.29.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
makedepends=('go-pie>=1.13')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wtfutil/wtf/archive/v$pkgver.tar.gz")
sha256sums=('a9e2f401bcbc593bdfcb224007d15de5e13485da1758d46bdd84bdf1fdbd92a7')

build() {
    export GOPROXY="https://gocenter.io"

    cd wtf-$pkgver
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS -X 'main.version=$pkgver' -X 'main.date=$(date)'" \
        -o $pkgname .
}

package(){
    cd "wtf-$pkgver"
    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 {README,CHANGELOG}.md -t "$pkgdir/usr/share/doc/$pkgname"
    cp -r _sample_configs "$pkgdir/usr/share/doc/$pkgname/sample_configs"
}
