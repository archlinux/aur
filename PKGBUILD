# Maintainer: coloursofnoise <coloursofthenoise at google mail>
pkgname=everest-mons
_name=mons
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-Line Installer and Manager for Celeste Modding"
url="https://github.com/coloursofnoise/mons"
arch=('any')
license=('MIT')
depends=('python' 'python-dnfile' 'python-pefile' 'python-click' 'python-tqdm' 'python-xxhash' 'python-pyyaml' 'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
conflicts=('mons')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('cbf58a835e782af149bb05302153e012')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 extras/mons.desktop "${pkgdir}/usr/share/applications/mons.desktop"

    cd mons/man
    for mandir in *; do
        install -d ${pkgdir}/usr/share/man/${mandir}
        install -m644 ${mandir}/* ${pkgdir}/usr/share/man/${mandir}/
    done
}
