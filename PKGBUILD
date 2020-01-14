# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-easyprocess
pkgname=('python2-easyprocess' 'python-easyprocess-doc')
pkgver=0.2.9
pkgrel=1
pkgdesc="EasyProcess - an easy to use python subprocess interface."
arch=('any')
url="http://easyprocess.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python2-setuptools' 'python2-sphinx')
#checkdepends=('python2-pytest' 'python2-nose' 'python2-pyvirtualdisplay')
source=("https://files.pythonhosted.org/packages/source/E/EasyProcess/EasyProcess-${pkgver}.tar.gz")
md5sums=('a1008fc7b2cb69ff2f48a5fae201c24d')

build() {
    cd ${srcdir}/EasyProcess-${pkgver}
    python2 setup.py build

    msg "Building Docs"
    python2 setup.py build_sphinx
}

check() {
    cd ${srcdir}/EasyProcess-${pkgver}

    python2 setup.py test
#   PYTHONPATH="build/lib" pytest2
}

package_python2-easyprocess() {
    depends=('python2>=2.7' 'python2-setuptools')
    optdepends=('python-easyprocess-doc: Documentation for EasyProcess')
    cd ${srcdir}/EasyProcess-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-easyprocess-doc() {
    pkgdesc="Documentation for EasyProcess"
    cd ${srcdir}/EasyProcess-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
