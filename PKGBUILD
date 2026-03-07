# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.28.1
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt6-base')
optdepends=('postgresql-libs')
options=(!debug)
sha256sums_x86_64=('d9776601ab6628ad8cb37f854a72f784acd4e11ffa132b017c4153a259f6bb3a')
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
