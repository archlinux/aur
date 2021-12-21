# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='1.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='ev3dev/ev3dev-lang-python'

pkgname='python-ev3dev'
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
sha256sums=('f6b5040fe97b76050f2f6682f17742d6bcd62cc82cd32a0f10c8387d02629ad6')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    sed -i "/version=/c\    version='${pkgver}'," setup.py
    echo "__version__ = '${pkgver}'" | tee "./ev3dev/version.py"
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
