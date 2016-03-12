# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.22.3
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-script')
optdepends=('postgresql-libs')
install='t-lasku.install'
if test "$CARCH" == x86_64; then
  source=(http://helineva.net/t-lasku/t-lasku-1.22.3-amd64.tar.gz)
  sha1sums=('eee62ab69292e9f5f38bed8cfe030e0a8ac0fc57')
else
  source=(http://helineva.net/t-lasku/t-lasku-1.22.3-i386.tar.gz)
  sha1sums=('d0ce03038c5f4b2e01982789ec6ede9e4f8b59c9')
fi

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -lQt5Script -lQt5Sql -lQt5Xml -lQt5Gui -lQt5Widgets \
    -lQt5PrintSupport -lQt5Core -lpthread -lstdc++ \
    -o t-lasku t-lasku-relocatable
  gcc -lQt5Script -lQt5Sql -lQt5Xml -lQt5Gui -lQt5Widgets \
    -lQt5PrintSupport -lQt5Core -lpthread -lstdc++ \
    -o t-lasku-cli t-lasku-cli-relocatable
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
