# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-sphinx-gallery
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.4.0
pkgrel=1
pkgdesc="Sphinx extension to automatically generate an examples gallery"
arch=('i686' 'x86_64')
url="http://sphinx-gallery.readthedocs.io/"
license=('BSD')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-cov' 'python2-matplotlib' 'python2-pillow' 'python2-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1f3e578107ca253a184889733a4fbcea')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py test
}

package_python2-sphinx-gallery() {
    depends=('python2-sphinx' 'python2-matplotlib' 'python2-pillow')
    optdepends=('python2-seaborn')
#               'python-sphinx-gallery-doc: Documentation of Sphinx-Gallery')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1

    mv ${pkgdir}/usr/bin/copy_sphinxgallery{,2}.sh
    mv ${pkgdir}/usr/bin/sphx_glr_python_to_jupyter{,2}.py
}
