# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-akshare
pkgver=1.2.37
pkgrel=1
pkgdesc="Financial data interface library"
arch=('any')
url='https://www.akshare.xyz'
license=('MIT')
depends=(
	'python-beautifulsoup4'
	'python-lxml'
	'python-matplotlib'
	'python-numpy'
	'python-pandas'
	'python-requests'
	'python-urllib3'
	'python-pillow'
	'python-pinyin'
	'python-websocket-client'
	'python-html5lib'
	'python-tqdm'
	'python-xlrd'
	'python-openpyxl'
	'python-jsonpath-ng'
	'python-tabulate'
	'python-decorator'
	'python-pyminiracer')
makedepends=('python-setuptools')
changelog=changelog.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/jindaxiang/akshare/archive/v$pkgver.tar.gz")
sha256sums=('d1248e13efdc0f0e027240499e84e3fa2313e4036eaf2a01a8a917f5139bcd40')

prepare() {
	cd "akshare-$pkgver"
	sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

build() {
	cd "akshare-$pkgver"
	python setup.py build
}

package() {
	cd "akshare-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
