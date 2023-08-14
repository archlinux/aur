# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-colored
_name=${pkgname#python-}
pkgver=2.2.3
pkgrel=1
pkgdesc="Very simple Python library for color and formatting in terminal"
arch=('any')
url="https://gitlab.com/dslackw/colored"
license=('MIT')
depends=('python')
makedepends=(python-build python-flit python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('1905ae45fa2b7fd63a8b4776586e63aeaba4df8db225b72b78fd167408558983'
            '6e38bc085fb26b5aa0db7b77be9893a805cce0badb2c2950d2fd36626b9a8dd1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
