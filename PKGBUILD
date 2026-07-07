# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-py-walk
_pkgname=py-walk
_name=py_walk
pkgver=0.3.3
pkgrel=1
pkgdesc="Python library to filter filesystem paths based on gitignore-like patterns"
url="https://github.com/pacha/py-walk/"
depends=(python python-sly)
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=(python-pytest)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/pacha/py-walk/$pkgver/LICENSE")
sha256sums=('a1b28d6079f27203fa3098b69a98572675b3ff5bd02286c43e6dacd66615f879'
            'ef90bb92cffa5edf683614d95ca7a7bc51f6d7ef1f8e6c70fdfba4d7fd031455')

build() {
    cd "$srcdir/$_name-$pkgver"
    python3 -m build --wheel
}

check() {
    cd "$srcdir/$_name-$pkgver"
    python -m pytest
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
