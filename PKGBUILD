# Maintainer: fenuks
# Original maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=django_upgrade
pkgname=django-upgrade
pkgver=1.32.0
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('4b709f32df70efc00389706eb1398a1c7332c998bbf81e95cfae7c5d68203795bf3e74175de838db14d38114294dbbf59be25ff8345e91023c53798563f32722')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
