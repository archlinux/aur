_name=pyjnius
pkgname=python-$_name
pkgver=1.7.0
pkgrel=1
pkgdesc='Python module to access Java class as Python class, using JNI.'
arch=(any)
url="https://github.com/kivy/$_name"
license=(MIT)
depends=(python java-environment python-six)
makedepends=(cython python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        cython-version.patch)
sha256sums=('9f81708484b0a84ead3eb0ba84e53ac579e4c43ca10c746f9898a9f3dd50f54d'
            '70a518662c51acc3fda703a0909bb6e0f7af7c4610888a0d09e1e6968cbdd49a')

prepare() {
	cd "$_name-$pkgver"
	patch -p1 -i "$srcdir/cython-version.patch"
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
