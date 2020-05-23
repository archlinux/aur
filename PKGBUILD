# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.26.2
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-xmlpatterns')
optdepends=('postgresql-libs')
sha256sums_x86_64=('8362d850c281e510aa72924d9a88223b6f2a247ea7d935cf976a74df83109f7b')
sha256sums_i686=('1b91898e72de98a98016df09607bd46a3b82d29bb17916123b406c70d4b23360')
source_x86_64=("http://helineva.net/t-lasku/t-lasku-$pkgver-amd64.tar.gz")
source_i686=("http://helineva.net/t-lasku/t-lasku-$pkgver-i386.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -lQt5Sql -lQt5Xml -lQt5XmlPatterns -lQt5Gui -lQt5Widgets \
    -lQt5PrintSupport -lQt5Core -lpthread -lstdc++ -lm \
    -o t-lasku t-lasku-relocatable
  gcc -lQt5Sql -lQt5Xml -lQt5XmlPatterns -lQt5Gui -lQt5Widgets \
    -lQt5PrintSupport -lQt5Core -lpthread -lstdc++ -lm \
    -o t-lasku-cli t-lasku-cli-relocatable
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
