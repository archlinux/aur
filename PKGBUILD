# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_srcname='rubicon-objc'
_name="python-${_srcname}"
pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=0.3.1.r10.g8f87954
pkgrel=1
pkgdesc='A bridge interface between Python and Objective-C'
arch=('any')
url="https://github.com/beeware/${_srcname}"
license=('custom')
source=("git+${url}")
makedepends=('git' 'python-setuptools')
depends=('python')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

build() {
    cd "${srcdir}/${_srcname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_srcname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
