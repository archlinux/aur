# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-vault
pkgver=5.4.0
pkgrel=1
pkgdesc='A vault for securely storing and accessing AWS credentials in development environments'
arch=('x86_64' 'i686')
url='https://github.com/99designs/aws-vault'
license=('MIT')
makedepends=('go')
optdepends=('zenity: graphical prompt'
            'kdialog: graphical prompt')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('67fac0bbc4be7f2297e47004a9cb224ba103b51206e00ee4fb98252faf298793')

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
