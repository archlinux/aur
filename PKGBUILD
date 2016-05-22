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
  sha1sums=('48fd5a1d65fcabc4143ceb4733c2b1837fd1ef19')
else
  source=(http://helineva.net/t-lasku/t-lasku-$pkgver-i386.tar.gz)
  sha1sums=('a77ebedc5ed78be76300f44f657566e7be74ac1e')
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
