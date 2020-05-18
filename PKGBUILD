# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=qrcp
pkgver=0.6.3
pkgrel=1
pkgdesc="Transfer files over Wi-Fi from your computer to a mobile device by scanning a QR code without leaving the terminal"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2d39ba661aad9c60b816bc06f53ef4f3d8747e11d5fc27c104d3687d1e77204c')

build() {
    cd $pkgname-$pkgver
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags $LDFLAGS" \
        -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
