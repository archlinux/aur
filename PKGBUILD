# Maintainer: coloursofnoise <coloursofthenoise at google mail>
pkgname=everest-mons
_name=mons
pkgver=1.4.1
pkgrel=1
pkgdesc="Command-Line Installer and Manager for Celeste Modding"
url="https://github.com/coloursofnoise/mons"
arch=('any')
license=('MIT')
depends=('python' 'python-dnfile' 'python-pefile' 'python-click' 'python-tqdm' 'python-xxhash' 'python-pyyaml' 'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('mons')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('18d21726e416aebbb16f6a1229b9229d')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
