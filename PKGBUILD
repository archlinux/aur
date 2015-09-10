# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Stefan Reuter <stefan dot gert dot r at gmail dot com>

pkgname=fusion-qt4-hg
_hgname=fusion-qt4
pkgver=13.4531c2274371
pkgrel=1
pkgdesc='This is new Fusion GUI style, ported from Qt 5 to Qt 4.'
arch=(i686 x86_64)
url=https://code.google.com/p/fusion-qt4/
license=(LGPL)
depends=(qt4)
makedepends=(mercurial qt4-private-headers-dev)
source=('hg+https://code.google.com/p/fusion-qt4/')
md5sums=(SKIP)

pkgver()
{
  cd ${_hgname}
  echo $(hg identify -n).$(hg identify -i)
}

prepare()
{
  cd ${_hgname}
  sed -i "s|QTSRC = E:/Soft/QtSDK/QtSources/4.8.0/src|QTSRC = /usr/src/qt4|g" fusion.pro
  sed -i "s|DESTDIR = \$\$\[QT_INSTALL_PLUGINS\]/styles|DESTDIR = ${pkgdir}/\$\$\[QT_INSTALL_PLUGINS\]/styles|g" fusion.pro
}

build()
{
  cd ${_hgname}
  qmake-qt4
}

package()
{
  cd ${_hgname}
  make
}
