# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sphinx-copybutton
pkgname="python-${_pyname}-doc"
pkgver=0.5.0
pkgrel=1
pkgdesc="Documentation for Sphinx-Copybutton extension"
arch=('any')
url="https://sphinx-copybutton.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'ipython' 'python-sphinx-book-theme' 'python-myst-nb')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/executablebooks/sphinx-copybutton/master/CHANGELOG.md")
md5sums=('223f26b9ba5397e5554075bc540a3b46'
         'SKIP')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

#   sed -i "/^exclude/s/\"\]/\",\ \"\*\*\.ipynb_checkpoints\"\]/" conf.py
#   sed -i "/^extensions/s/directive\"\]/directive\",\ \'IPython\.sphinxext\.ipython_console_highlighting\'\]/" conf.py
    ln -rs ${srcdir}/CHANGELOG.md ${srcdir}/${_pyname}-${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    pkgdesc="Documentation for Sphinx-Copybutton extension"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase%-doc}"
}
