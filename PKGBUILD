# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name='python-dbus-next'
pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=0.1.4.r0.g073d837
pkgrel=1
pkgdesc='The next great DBus library for Python with asyncio support'
arch=('any')
url="https://github.com/altdesktop/${_name}"
license=('MIT')
source=("git+${url}")
makedepends=('git' 'python-setuptools' 'python-pytest')
depends=('python')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
}

build() {
    cd "${srcdir}/${_name}"
    python setup.py build
}

#check(){
#    cd "${srcdir}/${_name}"
#    python setup.py install --root="${srcdir}/${_name}/tmp_install"
#    pysys="$(python -c 'import sys; print(sys.version_info.minor)')"
#    pydir="${srcdir}/${_name}/tmp_install/usr/lib/python${pysys}/site-packages"
#    PYTHONPATH="${pydir}:${PYTONPATH}" pytest
#}

package() {
    cd "${srcdir}/${_name}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
