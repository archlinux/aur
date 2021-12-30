# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.2.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='custom'
_repo='stephanh42/hexutil'
_upstreamver_check() {
    # TODO
    printf '%s' "${_upstreamver}"
}


pkgname='python-hexutil'
_pkgname='hexutil'
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Classes and functions to deal with hexagonal grids"
url="https://github.com/${_repo}"
depends=('python')
makedepends=('cython' 'python-setuptools')
license=('mit')
arch=('any')
source=("https://files.pythonhosted.org/packages/47/2e/7ecab7ecf2c9c97b0307086426aaf6213fb577b515f6dd3177add520d73c/hexutil-${pkgver}.tar.gz")
sha256sums=('64e0de4d0ed52f75ada204b6878a837d095521c0086410f9dbcfe30c640cba6f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
