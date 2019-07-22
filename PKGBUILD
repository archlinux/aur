# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-novas
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=3.1.1.4
pkgrel=1
pkgdesc="The United States Naval Observatory NOVAS astronomy library"
arch=('i686' 'x86_64')
url="https://www.usno.navy.mil/USNO/astronomical-applications/software-products/novas"
license=('custom')
#checkdepends=('python-pytest' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('13b07878f9e0404e33a044fc2d6840a0')

prepare() {
    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

package_python2-novas() {
    optdepends=('python2-novas_de405: high-accuracy ephemeris data set')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-novas() {
    optdepends=('python-novas_de405: high-accuracy ephemeris data set')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README*
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
