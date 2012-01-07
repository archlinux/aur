# $Id$
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
pkgbase="python-sphinx"
pkgname=('python-sphinx' 'python2-sphinx')
pkgver=1.1.2
pkgrel=2
pkgdesc="Python documentation generator"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
makedepends=('python2-distribute' 'python-distribute' 'python2-pygments' 'python-pygments' 'docutils' 'python2-jinja' 'python-jinja')
optdepends=('texlive-latexextra: for generation of PDF documentation'
            'texlive-latex3: for generation of PDF documentation')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('b65a5d5d6172f3dcfefb4770ec63926e')
 
build() {
    cp -R "$srcdir/Sphinx-$pkgver" "$srcdir/Sphinx2-$pkgver"
}
 
package_python-sphinx() {
    depends=('python-distribute' 'python-jinja' 'python-pygments' 'docutils')
    conflicts=('python2-sphinx')
    cd "$srcdir/Sphinx-$pkgver"
    python setup.py install --root="$pkgdir" -O1
}
 
package_python2-sphinx() {
    depends=('python2-distribute' 'python2-jinja' 'python2-pygments' 'docutils')
    conflicts=('python-sphinx')
    cd "$srcdir/Sphinx2-$pkgver"
    # python2 fix
    sed -i 's_#! /usr/bin/env python_#! /usr/bin/env python2_' sphinx/pycode/pgen2/token.py
    python2 setup.py install --root="$pkgdir" -O1
}
