# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.5.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_repo='dave-howard/vsdx'
_pypi_package='vsdx'

pkgname='python-vsdx'
_pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A python library for processing Visio .vsdx files"
url="https://github.com/${_repo}"
depends=('python' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-jinja')
makedepends=('cython' 'python-setuptools')
license=('BSD-3-Clause')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package}/${_pypi_package}-${pkgver}.tar.gz")
sha256sums=('ed3ae2b6113da26782c964207733f1f6db68d8697db9e27097b220379ded1373')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
