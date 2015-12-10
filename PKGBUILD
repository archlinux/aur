# $Id$
# Maintainer: Pedro Martinez-Julia <pedromj@um.es>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python2-matplotlib-noqt
pkgver=1.5.0
pkgrel=2
pkgdesc="A python plotting library, making publication quality plots"
arch=('i686' 'x86_64')
url='http://matplotlib.org'
license=('custom')
depends=('python2-pytz' 'python2-numpy' 'python2-cairo' 'python2-dateutil' 'python2-pyparsing' 'python2-cycler')
makedepends=('python2-pytz' 'python2-numpy' 'tk' 'python2-cairo' 'python2-dateutil'
    'python2-gobject' 'python2-pyparsing' 'pygtk' 'python-six' 'ghostscript' 'texlive-bin')
optdepends=('python-gobject: for GTK3Agg/GTK3Cairo backend'
    'python-cairo: for GTK3Cairo backend'
    'tk: used by the TkAgg backend'
    'ghostscript: usetex dependencies'
    'texlive-bin: usetex dependencies'
    'python-tornado: for webagg backend')
source=("https://github.com/matplotlib/matplotlib/archive/v$pkgver.tar.gz")
sha512sums=('017797c139383e1878cbd4b5595c192f2dedf649e2d268d4bad5421e4a955f3da6d1c9011ce29d6f3487709bb3a8592693d8914335f9f95254a2e267e7ea1cf5')

prepare() {
   cd matplotlib-${pkgver}
   for file in $(find . -name '*.py' -print); do
      sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python2|" \
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python2|" ${file}
   done
}

build() {
   cd matplotlib-${pkgver}
   python2 setup.py build
}

package() {
   cd matplotlib-${pkgver}
   python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr

   install -dm755 "${pkgdir}"/usr/share/licenses/python2-matplotlib-noqt
   install -m 644 doc/users/license.rst "${pkgdir}"/usr/share/licenses/python2-matplotlib-noqt
}
