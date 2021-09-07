# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgbase=python-glad
pkgname=(python-glad python2-glad)
pkgver=0.1.34
pkgrel=2
pkgdesc='Multi-language GL/GLES/EGL/GLX/WGL loader-generator'
arch=('any')
url='https://github.com/Dav1dde/glad'
license=('MIT' 'Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4be2900ff76ac71a2aab7a8be301eb4c0338491c7e205693435b09aad4969ecd')

prepare() {
	cp -a "glad-$pkgver" "glad-$pkgver-py2"
}

build() {
	pushd "glad-$pkgver"
	python setup.py build
	popd

	pushd "glad-$pkgver-py2"
	python2 setup.py build
}

package_python-glad() {
	depends=('python3')

	cd "glad-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python2-glad() {
	depends=('python2')
	conflicts=('python-glad')

	cd "glad-$pkgver-py2"
	export PYTHONHASHSEED=0
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
