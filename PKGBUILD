# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.25.0
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-script')
optdepends=('postgresql-libs')
install='t-lasku.install'
sha256sums_x86_64=('92cd3859fb1c6b029dc4b41a7f9ef4b4eefa848e114b480ba23ca275792f3f77')
sha256sums_i686=('93df8ff4806531192c0fe4c0fd5c9652e3c066c8f5d1ed700a269066ce09acf9')
source_x86_64=("http://helineva.net/t-lasku/t-lasku-$pkgver-amd64.tar.gz")
source_i686=("http://helineva.net/t-lasku/t-lasku-$pkgver-i386.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -lQt5Script -lQt5Sql -lQt5Xml -lQt5XmlPatterns -lQt5Gui -lQt5Widgets \
    -lQt5PrintSupport -lQt5Core -lpthread -lstdc++ \
    -o t-lasku t-lasku-relocatable
  gcc -lQt5Script -lQt5Sql -lQt5Xml -lQt5XmlPatterns -lQt5Gui -lQt5Widgets \
    -lQt5PrintSupport -lQt5Core -lpthread -lstdc++ \
    -o t-lasku-cli t-lasku-cli-relocatable
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
