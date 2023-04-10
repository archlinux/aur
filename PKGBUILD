# Contributor: 	xantares
# Maintainer: asuka minato
pkgname=python-doc2dash
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Create docsets for Dash.app-compatible API browser."
url="https://doc2dash.readthedocs.io/en/stable/"
arch=(any)
license=('MIT')
makedepends=(python-hatch-vcs python-hatch-fancy-pypi-readme python-build python-installer python-wheel python-hatchling)
depends=('python' 'python-attrs' 'python-beautifulsoup4' 'python-click' 'python-rich')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
https://raw.githubusercontent.com/hynek/doc2dash/41632ffe36c1db309493feaf54fd8d6b814fef85/LICENSE)
provides=('python-doc2dash')
sha256sums=('5456ee60cce489dd03f6e236b2d997f949d17de3a0fce5e6be3c262493efa1ee'
            'db4f023d9e71791480d1ea447361fd87263ecaac5d420be3b5bb36c72e07c5c5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 LI* -t $pkgdir/usr/share/licenses/$pkgname/
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

