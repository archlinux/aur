# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# shellcheck disable=SC2034,SC2154

pkgname=sleepcount
pkgver=0.2.1
pkgrel=1
pkgdesc="just as a simple 'sleep' CLI util but with options for countdown and HH:MM:SS target time"
arch=('any')
url="https://github.com/actionless/sleepcount"
license=('GPL3')
source=(
	"$pkgname-$pkgver.tar.gz"::https://github.com/actionless/sleepcount/archive/"$pkgver".tar.gz
)
md5sums=('bb799655bb8795c7d4e519f95ecdc44a')
depends=(
	'python'
)
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
	'python-markdown-it-py'
)
optdepends=(
)
conflicts=('sleepcount-git')
provides=('sleepcount')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	if test -d ./dist ; then
		rm -r ./dist
	fi
	/usr/bin/python3 -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
	/usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	#install -Dm644 sleepcount.1 "$pkgdir/usr/share/man/man1/sleepcount.1"
	cp -r ./packaging/* "${pkgdir}"
}
