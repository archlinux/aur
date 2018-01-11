# Maintainer: Evgeniy Alekseev <esalexeev@gmail.com>

pkgname=qscite
pkgver=0.5_svn211
_pkgrev=211
pkgrel=2
pkgdesc="A code editor written in C++ and Qt4; A clone of SciTE"
arch=('i686' 'x86_64')
url="https://github.com/AndreaIdini/QSciTE"
license=('GPL')
depends=('qt4')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-r${_pkgrev}.tar.gz"
        get_qsci.sh.patch
        qscite.pro.patch)
md5sums=('2ce7a915e5560725d897816688a4bef7'
         '4720cc18cf7140b57b0aa4fb40cc6ee3'
         '9dc1e5684571e8a30c71f2752a511dc3')

prepare()
{
  cd "${srcdir}/${pkgname}"
  # fix scintilla2 download path
  patch -p1 -i "${srcdir}/get_qsci.sh.patch"
  # add install section and fix filepath
  patch -p1 -i "${srcdir}/qscite.pro.patch"
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
