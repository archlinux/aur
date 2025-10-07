# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>
pkgname=python-desktop-notifier
pkgver=6.1.1
pkgrel=1
pkgdesc='Python library for cross-platform desktop notifications'
arch=('any')
url="https://github.com/SamSchott/desktop-notifier"
license=('MIT')
depends=('python'
         'python-bidict'
         'python-certifi'
         'python-charset-normalizer'
         'python-dbus-fast'
         'python-packaging')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-sphinx'
             'python-sphinx-autoapi'
             'python-sphinx-furo'
             'python-sphinx_mdinclude'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('60b1eef6edb645ce48eb89fa8ef955e6c0aa34787808247587acc16c281fe871')

build() {
	cd "${pkgname#python-}-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	cd "${pkgname#python-}-$pkgver"
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dvm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
	install -Dvm644 docs/_build/man/desktop-notifier.1 "${pkgdir}/usr/share/man/man1/$pkgname.1"
	install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
