# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-miniballcpp
#_pyname=miniball
_pyname=MiniballCpp
pkgname=('python-miniballcpp')
pkgver=0.2.3
pkgrel=1
pkgdesc="Smallest Enclosing Balls of Points"
arch=('i686' 'x86_64')
url="https://github.com/weddige/miniball"
license=('GPL3')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
#source=("https://github.com/weddige/miniball/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('fba99a497f17b7caf27d55036a524ada')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv --color=yes
}

package_python-miniballcpp() {
    cd ${srcdir}/${_pyname}-${pkgver}
    depends=('python')

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
