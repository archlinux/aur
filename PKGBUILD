# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>

pkgname=python-overrides
_name=${pkgname#python-}
pkgver=7.3.1
pkgrel=2
pkgdesc="A decorator to automatically detect mismatch when overriding a method"
url='https://github.com/mkorpela/overrides'
arch=('any')
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'mypy')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('8b97c6c1e1681b78cbc9424b138d880f0803c2254c5ebaabdde57bb6c62093f2')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

check() {
    cd "${_name}-${pkgver}"
    pytest tests
    mypy overrides
    sh ./check_mypy.sh
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set et sw=4 sts=4 tw=80:
