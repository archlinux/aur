# $Id$
# Maintainer: Pedro Martinez-Julia <pedromj@um.es>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python2-matplotlib-noqt
pkgver=1.4.3
pkgrel=1
pkgdesc="A python plotting library, making publication quality plots"
arch=('i686' 'x86_64')
url='http://matplotlib.org'
license=('custom')
depends=('python2-pytz' 'python2-numpy' 'python2-cairo' 'python2-dateutil' 'python2-pyparsing')
makedepends=('python2-pytz' 'python2-numpy' 'tk' 'python2-cairo' 'python2-dateutil'
    'python2-gobject' 'python2-pyparsing' 'pygtk' 'python-six' 'ghostscript' 'texlive-bin')
optdepends=('python-gobject: for GTK3Agg/GTK3Cairo backend'
    'python-cairo: for GTK3Cairo backend'
    'tk: used by the TkAgg backend'
    'ghostscript: usetex dependencies'
    'texlive-bin: usetex dependencies'
    'python-tornado: for webagg backend')
source=("https://github.com/matplotlib/matplotlib/archive/v$pkgver.tar.gz")
sha512sums=('4aebbda31934bedbee5206b783e5cbe07db17367d50117a50bb80b7ea4aad987ec225958bed58885c561f00582c309d6e8c0a69861d3b4210a09b2d63975d2aa')

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
