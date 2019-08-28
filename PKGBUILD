# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stregion
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=1.1.6
pkgrel=1
pkgdesc="Python parser for ds9 region files"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/stregion"
license=('MIT' 'BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy')
checkdepends=('python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/stregion/master/LICENSE.txt")
md5sums=('7b23f7aaad4d2f07e59294b469d9b321'
         '90af6948044c90bc28a1fed1865cc6ea')

prepare() {
    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
}

check() {
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-stregion() {
    depends=('python2-numpy' 'python2-pyparsing>=2.0.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE_kapteyn.txt
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-stregion() {
    depends=('python-numpy' 'python-pyparsing>=2.0.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE_kapteyn.txt
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
