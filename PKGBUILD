# Maintainer: Tommi Helineva <tommi.helineva+aur@gmail.com>
pkgname=t-lasku
pkgver=1.24.0
pkgrel=1
pkgdesc="A Finnish invoicing software"
arch=('i686' 'x86_64')
url="http://helineva.net/t-lasku/"
license=('BSD')
depends=('qt5-base' 'qt5-script')
optdepends=('postgresql-libs')
install='t-lasku.install'
if test "$CARCH" == x86_64; then
  source=(http://helineva.net/t-lasku/t-lasku-$pkgver-amd64.tar.gz)
  sha1sums=('4c566358e4c1207c166ae2931fd3eccf2a96bd5a')
else
  source=(http://helineva.net/t-lasku/t-lasku-$pkgver-i386.tar.gz)
  sha1sums=('b85026d6263982faa9415326371fcccdb3222018')
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
