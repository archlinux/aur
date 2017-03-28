# $Id$
# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Michael Krauss <hippodriver at gmx dot net>
# Contributor: dsa

_pkgbase=python-pmw
pkgname='python2-pmw-mgltools2'
pkgver=2.0.1
pkgrel=3
pkgdesc="A toolkit for high-level compound widgets in Python using the Tkinter module"
arch=('any')
url="http://pmw.sourceforge.net/"
license=('MIT')
depends=('mgltools2')
source=(${_pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/Pmw/Pmw-${pkgver}.tar.gz
        "LICENSE.txt")
md5sums=('8080b0fabc731ff236f97e88e13b3938'
         'e1bd6c6e99932d324ec389bf29450c91')
#changelog="ChangeLog"

prepare() {
  cd "Pmw-${pkgver}"
  find . -name '*.py' -exec \
      sed -i "s|python|pythonsh-mg|g" {} \;
}

build() {
  cd "$srcdir/Pmw-${pkgver}"
  pythonsh-mg setup.py build
}

package() {

  cd "$srcdir/Pmw-${pkgver}"
  pythonsh-mg setup.py install --prefix=/opt/mgltools2 --root="${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

