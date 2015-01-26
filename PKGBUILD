pkgname=spim-svn
pkgver=643
pkgrel=2
pkgdesc="A MIPS32 simulator (SVN version)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/spimsimulator/"
license=('custom:BSD')
groups=('emulators')
depends=('glibc')
makedepends=('bison' 'flex' 'subversion')
conflicts=('spim')
provides=('spim')

_svntrunk='svn.code.sf.net/p/spimsimulator/code'
source=("svn://${_svntrunk}/spim"
        "svn://${_svntrunk}/CPU")
md5sums=("SKIP" "SKIP")

build() { 
  cd ${srcdir}/spim

  make
}

pkgver() {
  cd "${srcdir}/spim"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

package() {
  install -Dm644 ${srcdir}/spim/README ${pkgdir}/usr/share/licenses/${pkgname}/README

  cd ${srcdir}/spim
  install -dDm755 ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install
}
