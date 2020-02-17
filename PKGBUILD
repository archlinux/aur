# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-vault
pkgver=5.3.1
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
makedepends=('go')
optdepends=('zenity: graphical prompt'
            'kdialog: graphical prompt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2dfd7e4b119c2b5b1207a350cf3e5278c21aca612b7ea2d4eafc2f705d48c7e0')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -ldflags="-X main.Version=v$pkgver" \
    -o $pkgname .
}

check() {
  cd $pkgname-$pkgver
  go test ./...
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
