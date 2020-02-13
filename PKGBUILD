# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-vault
pkgver=5.2.1
pkgrel=2
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
makedepends=('go')
optdepends=('zenity: graphical prompt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('64807f1a6a7fe92a4383e6a99137be4f9970c6c71da6e0aa971256e482075fd4')

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
