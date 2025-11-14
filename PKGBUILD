# Maintainer: a821 (nospam) mail de
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.9.4
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('x86_64')
url="https://github.com/amueller/word_cloud"
license=('MIT')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'cython')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b273d8a5ded97d3ead904046b49464dcb71119ee79df875072a4c105cadd347a')

prepare() {
    cd "$_pkgname-$pkgver"
    sed -i 's/^license.*$/license = "MIT"/' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
