# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=emotion_generic_players-git
_pkgname=emotion_generic_players
pkgver=1.7.99.x
pkgrel=1
pkgdesc="Players for Emotion using the 'generic' module - Currently VLC"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git' 'vlc')
makedepends=('git')
conflicts=('emotion_generic_players-svn')
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done
  
  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package(){
  cd "$srcdir/$_pkgname"
  
  make DESTDIR="$pkgdir" install
  
# install license files
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
}
