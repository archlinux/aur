# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=sleepcount
pkgver=0.1.2
pkgrel=1
pkgdesc="just as a simple 'sleep' CLI util but with countdown option and HH:MM:SS target time"
arch=('any')
url="https://github.com/actionless/sleepcount"
license=('GPL3')
source=(
	"$pkgname-$pkgver.tar.gz"::https://github.com/actionless/sleepcount/archive/"$pkgver".tar.gz
)
md5sums=('11393114d7fe3e16fea6aad716a8425c')
depends=(
	'python'
)
optdepends=(
)
conflicts=('sleepcount-git')
provides=('sleepcount')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	/usr/bin/python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#install -Dm644 sleepcount.1 "$pkgdir/usr/share/man/man1/sleepcount.1"
	cp -r ./packaging/* "${pkgdir}"
}
