# Maintainer: Cravix < dr dot neemous at gmail dot com >
# Contributor: Changaco < changaco at changaco dot net >

pkgname=efbb-git
_pkgname=efbb
pkgver=0.1.0.32.9158208
pkgrel=1
pkgdesc="Escape from Booty Bay is an EFL-based physics game that explore EPhysics amazing features"
arch=('i686' 'x86_64')
url="http://git.enlightenment.org/games/efbb.git"
license=('BSD' 'CCPL:BY' 'CCPL:BY-NC' 'CCPL:BY-SA' 'CCPL:sampling+')
depends=('elementary' 'efl' 'libcanberra' 'etrophy')
makedepends=('geneet-git' 'git')
conflicts=('efbb-svn')
replaces=('efbb-svn')
options=('!libtool')
source="git://git.enlightenment.org/games/$_pkgname.git"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install

  # install license files
  install -Dm644 $srcdir/$_pkgname/COPYING \
        $pkgdir/usr/share/licenses/$_pkgname/COPYING
}
