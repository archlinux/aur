# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.26.0
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-xmlpatterns')
optdepends=('postgresql-libs')
sha256sums_x86_64=('44de52b5bd5d4331f844470c0e543f1bd89e321e4ca3d7c4acea600c84deb946')
sha256sums_i686=('9a273e899a2a53956ca316ec66468e3b34fcde6cb22f03418114fa0ac4d28756')
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
