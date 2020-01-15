# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name='python-pyro5'
_srcname='Pyro5'
pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=5.6.r6.g2027bc9
pkgrel=3
pkgdesc='Remote objects communication library, fifth major version'
arch=('any')
url="https://github.com/irmen/${_srcname}"
license=('MIT')
source=("git+${url}")
makedepends=('git' 'python-setuptools' 'python-pytest' 'python-msgpack>=0.5.2')
depends=('python-serpent>=1.27')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

build() {
    cd "${srcdir}/${_srcname}"
    python setup.py build
}

check(){
    cd "${srcdir}/${_srcname}"
    pytest
}

package() {
    cd "${srcdir}/${_srcname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
