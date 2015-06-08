# Maintainer: Evgeniy Alekseev <esalexeev@gmail.com>

pkgname=qscite
pkgver=0.5_svn211
_pkgrev=211
pkgrel=2
pkgdesc="A code editor written in C++ and Qt4; A clone of SciTE"
arch=('i686' 'x86_64')
url="http://qscite.googlecode.com/"
license=('GPL')
depends=('qt4')
source=(http://qscite.googlecode.com/files/${pkgname}-r${_pkgrev}.tar.gz
        get_qsci.sh.patch
        qscite.pro.patch)
md5sums=('2ce7a915e5560725d897816688a4bef7'
         '0bb49a6179912d6d0b674c5623a45a34'
         'c13cc624b2ed1ce7a980afbb2d2bbc15')

prepare()
{
  cd "${srcdir}/${pkgname}"
  # fix scintilla2 download path
  patch -p0 < "${srcdir}/get_qsci.sh.patch"
  # add install section and fix filepath
  patch -p0 < "${srcdir}/qscite.pro.patch"
  # fix version
  sed -i "s#0.5-svn190#${pkgver//_/-}#" qscite.desktop
}

build()
{
  cd "${srcdir}/${pkgname}"
  qmake-qt4 PREFIX=/usr -Wnone qscite-release.pro
  make
}

package()
{
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}
