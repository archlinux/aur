# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.28.1
pkgrel=2
pkgdesc="A Finnish invoicing software"
arch=('x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt6-base')
optdepends=('postgresql-libs')
options=(!debug)
sha256sums_x86_64=('2c362b27c80292e5503d6a9bc9f769d731865eee7693f3fd2dc1d7e5fab1828b')
source_x86_64=("http://helineva.net/t-lasku/t-lasku-$pkgver-amd64.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gcc -lm -ldl -lQt6Sql -lQt6Xml -lQt6Gui -lQt6Widgets \
    -lQt6PrintSupport -lQt6Core -lpthread -lstdc++ \
    -o t-lasku t-lasku-relocatable
  gcc -lm -ldl -lQt6Sql -lQt6Xml -lQt6Gui -lQt6Widgets \
    -lQt6PrintSupport -lQt6Core -lpthread -lstdc++ \
    -o t-lasku-cli t-lasku-cli-relocatable
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
