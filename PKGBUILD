# Maintainer: Jan Niklas Böhm <mail@jnboehm.com>

_pkgname='prettymaps'
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='A minimal Python library to draw customized maps from OpenStreetMap data.'
arch=('any')
url='https://github.com/marceloprates/prettymaps'
_url_pypi='https://pypi.org/project/prettymaps/'
license=('CC-BY-NC-4.0')
depends=(
    'python-osmnx'
    'python-tabulate'
    'python-matplotlib'
    'python-shapely'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1f11ef4e8e86f43348ce546cd718459e8ef818163edbe0e4a6cc21a545908338')

build() {
    cd "${_pkgname}-${pkgver}"
    sed -i 's/install_requires=parent_dir.joinpath("requirements.txt").read_text().splitlines(),//' setup.py
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
    # install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
