# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='2.0.0beta1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+beta[0-9]+$'
_source_type='github-releases'
_repo='ev3dev/ev3dev-lang-python'

pkgname='python-ev3dev2'
_pkgname='ev3dev-lang-python'
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Python3 library implementing an interface for ev3dev devices"
url="https://github.com/${_repo}"
depends=('python' 'python-pillow')
makedepends=('cython' 'python-setuptools')
license=('mit')
arch=('any')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cef1008855426555e35030885cf39b33f415810675721f3ab42d8a3e824d80f7')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    sed -i "/version=/c\    version='${pkgver}'," setup.py
    echo "__version__ = '${pkgver}'" | tee "./ev3dev2/version.py"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    python setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
