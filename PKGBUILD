# Maintainer: Mikkel Kroman <mk@maero.dk>
#
# Checklist before updating:
# 1) Use the latest compatible version of date.h from https://github.com/HowardHinnant/date
# 2) Check that sqlpp11 doesn't have a date.h that will overwrite /usr/include/sqlpp11/date.h
pkgname=sqlpp11
pkgver=0.35
pkgrel=2
pkgdesc="A type safe embedded domain specific language for SQL queries and results in C++"
arch=('any')
url="https://github.com/rbock/sqlpp11"
license=('BSD')
depends=()
makedepends=('cmake')
source=("https://github.com/rbock/$pkgname/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/HowardHinnant/date/177032852d5b4614112ca1ab3ef42d6b41824816/date.h")
sha256sums=('f8470069dd655eedf9b6e986a631978ac733156852d3b8b98022fcfd65f6ba89'
            'ff6b7e6f62dd45ff245b077155e9c03011c37aa076701d46fca013b03415be15')

build() {
	cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATE_INCLUDE_DIR="${srcdir}" .
	make
}

check() {
  cd "$pkgname-$pkgver"
  # make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

  install -m644 "${srcdir}/date.h" "${pkgdir}/usr/include/sqlpp11/date.h"

  mkdir -p "${pkgdir}/usr/share/licenses/sqlpp11"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sqlpp11/LICENSE"
}
