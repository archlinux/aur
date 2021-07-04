# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=sphinx-copybutton
pkgname="python-${_pyname}-doc"
pkgver=0.4.0
pkgrel=1
pkgdesc="Documentation for Sphinx-Copybutton extension"
arch=('any')
url="https://sphinx-copybutton.readthedocs.io"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}" 'ipython' 'python-sphinx-book-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e7c8bd6e2a59e696b864281ff82f7194')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

#   sed -i "/^exclude/s/\"\]/\",\ \"\*\*\.ipynb_checkpoints\"\]/" conf.py
    sed -i "/^extensions/s/directive\"\]/directive\",\ \'IPython\.sphinxext\.ipython_console_highlighting\'\]/" conf.py
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
