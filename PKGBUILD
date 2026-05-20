# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

pkgname=python-diagrams
_name=${pkgname//python-}
pkgver=0.25.1
pkgrel=1
pkgdesc="Diagram as Code for prototyping cloud system architectures"
arch=('any')
url="https://diagrams.mingrammer.com"
license=('MIT')
depends=('python' 'python-graphviz' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('87480ba0b2d26987a69f7d553aa0cb1cebf1406adc03fef7031bdfff026bfc51')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl

    local site_packages
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    find resources/ -type f -exec install -Dm644 "{}" "$pkgdir/$site_packages/$_name/{}" \;

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
