# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=limix
pkgname=python-$_name
pkgver=0.8.0.dev0
_hcver=0.0.8
pkgrel=1
pkgdesc='A flexible and fast mixed model toolbox'
arch=(i686 x86_64)
url="http://pmbio.github.io/$_name"
license=(Apache)
provides=(python-hcache)
depends=(python python-scikit-learn python-pandas)
source=("https://files.pythonhosted.org/packages/source/l/$_name/$_name-$pkgver.tar.gz"
        "https://files.pythonhosted.org/packages/source/h/hcache/hcache-$_hcver.tar.gz")
md5sums=(ace3fe515ef3f4d87427f632ea7d2cbb
         e036dc8f5ec3c71059efadda7655a430)

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	for dir in "hcache-$_hcver" "$_name-$pkgver"; do
		cd "$srcdir/$dir"
		python setup.py install --root="$pkgdir" --optimize=1 || return 1
	done
}
