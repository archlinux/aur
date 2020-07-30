# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=python-country_list
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="List of all countries with names and ISO 3166-1 codes in all languages and all data formats."
arch=('any')
url="https://github.com/bulv1ne/country_list"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/bulv1ne/country_list/raw/v$pkgver/LICENSE")
sha256sums=('f73c4d319faa46541470918bb9e9dd5592401f316ee68f3fe55e90acf410f8a3'
            '6afcf07f6d24b50a5bb4738bfa2032c5a9f8f3fa93ad9c3d34d4ce87f7bde93e')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
