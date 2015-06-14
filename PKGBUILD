# $Id: PKGBUILD 89515 2013-04-29 16:41:19Z spupykin $
# Maintainer: AppleBloom <rat.o.drat@gmail.com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt3
pkgver=3.18.1
pkgrel=14
pkgdesc="A set of Python bindings for the Qt3 toolkit"
arch=('i686' 'x86_64')
url="http://www.riverbankcomputing.com/software/pyqt/intro"
depends=('python2-sip' 'qscintilla-qt3')
license=('GPL')
source=("http://downloads.sourceforge.net/project/pyqt/PyQt3/PyQt-x11-gpl-${pkgver}.tar.gz"
        "sip415_fix.patch")
md5sums=('f1d120495d1aaf393819e988c0a7bb7e'
         'd695dc23d2211a97d3631ec82d8afd67')

_dir="PyQt-x11-gpl-${pkgver}"

prepare() {
  cd "$_dir"
  patch -p0 -i "../sip415_fix.patch"
}

build() {
  cd "$_dir"
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt3/mkspecs/linux-g++
  echo yes | python2 configure.py -b /usr/bin \
    -d /usr/lib/python2.7/site-packages \
    -v /usr/share/sip \
    INCDIR_QT=/usr/include/qt3
  make CXX="g++ -DANY=void"
}

package() {
  cd "$_dir"
  make DESTDIR=${pkgdir} install
}
