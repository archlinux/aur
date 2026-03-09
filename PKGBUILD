# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.28.1
pkgrel=3
pkgdesc="A Finnish invoicing software"
arch=('x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt6-base')
optdepends=('postgresql-libs')
options=(!debug)
sha256sums_x86_64=('83a88a5e6336628dc00076d6687c3db6aa32587ba549c2401989cfbaccf13e6d')
source_x86_64=("http://helineva.net/t-lasku/t-lasku-$pkgver-amd64.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  QT_FLAGS=$(pkg-config --cflags --libs Qt6Core Qt6Gui Qt6Widgets Qt6Sql Qt6Xml Qt6PrintSupport)
  g++ t-lasku-relocatable -o t-lasku $QT_FLAGS -lm -ldl -lpthread
  g++ t-lasku-cli-relocatable -o t-lasku-cli $QT_FLAGS -lm -ldl -lpthread
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
