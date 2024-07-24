# Maintainer: Yauheni Kirylau <actionless dot loveless AT gmail.com>
# shellcheck disable=SC2034,SC2154

pkgname=sleepcount
pkgver=0.1.3
pkgrel=1
pkgdesc="just as a simple 'sleep' CLI util but with options for countdown and HH:MM:SS target time"
arch=('any')
url="https://github.com/actionless/sleepcount"
license=('GPL3')
source=(
	"$pkgname-$pkgver.tar.gz"::https://github.com/actionless/sleepcount/archive/"$pkgver".tar.gz
)
md5sums=('4f94a42539e456b80e2f67b6cf844d0d')
depends=(
	'python'
)
optdepends=(
)
conflicts=('sleepcount-git')
provides=('sleepcount')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	/usr/bin/python3 -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	/usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#install -Dm644 sleepcount.1 "$pkgdir/usr/share/man/man1/sleepcount.1"
	cp -r ./packaging/* "${pkgdir}"
}
