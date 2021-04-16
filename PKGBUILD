# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.27.0
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-xmlpatterns')
optdepends=('postgresql-libs')
sha256sums_x86_64=('b5f3e888b128a06ba832c31dafc93ae08fa94cc3edc2cd39acbcd74fd76f2de6')
sha256sums_i686=('bee8a9ce197e9889f00285b130d0867dda65bd2714c7594a3160bdf9f0a49cc7')
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
