# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sshpass-svn
pkgver=r79
pkgrel=1
pkgdesc="A tool for non-interactivly performing password authentication"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/sshpass/"
license=('GPL')
depends=('glibc' 'openssh')
makedepends=('subversion')
provides=("sshpass=$pkgver")
conflicts=('sshpass')
source=("svn+https://svn.code.sf.net/p/sshpass/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "trunk"

  #make check
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" install
}
