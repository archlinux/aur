# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinx-gallery
pkgname=('python-sphinx-gallery' 'python-sphinx-gallery-doc')
pkgver=0.1.13
pkgrel=1
pkgdesc="Sphinx extension to automatically generate an examples gallery"
arch=('i686' 'x86_64')
url="http://sphinx-gallery.readthedocs.io/en/latest/"
license=('BSD')
makedepends=('python-setuptools' 'python-sphinx' 'python-pillow' 'python-scipy' 'python-seaborn')
checkdepends=('python-pytest-cov')
source=("https://github.com/sphinx-gallery/sphinx-gallery/archive/v${pkgver}.tar.gz")
md5sums=('688b4aa331bc3d292106913f76da20ae')

build () {
    cd ${srcdir}/sphinx-gallery-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd $srcdir/sphinx-gallery-${pkgver}
    python setup.py test
}

package_python-sphinx-gallery() {
    depends=('python-sphinx' 'python-matplotlib' 'python-pillow')
    optdepends=('python-seaborn'
                'mayavi-py3'
                'python-sphinx-gallery-doc: Documentation of Sphinx-Gallery')
    cd ${srcdir}/sphinx-gallery-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sphinx-gallery-doc() {
    pkgdesc="Documentation for Sphinx-Gallery extension"
    cd ${srcdir}/sphinx-gallery-${pkgver}/doc/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
