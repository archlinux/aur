# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=pmgmusic-git
_gitname=pmgmusic
pkgver=v1.0
pkgrel=1
pkgdesc="PMG - a VOS clone for linux - Git version"
arch=('i686' 'x86_64')
url="https://github.com/felixonmars/pmgmusic"
license=('GPL')
depends=("timidity++" "alsa-lib" "gtk2" "glib2" "libglade")
provides=("pmgmusic")
source=("git://github.com/felixonmars/pmgmusic.git"
        fix_glade_path.patch)
md5sums=('SKIP'
         '68f454557d83a0c1e9d9d0083011bbfb')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  patch -Np1 -i ../fix_glade_path.patch
  make
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 pmg $pkgdir/usr/bin/pmg
  install -Dm755 dump_vos $pkgdir/usr/bin/dump_vos
  install -Dm644 pmg.glade $pkgdir/usr/share/pmgmusic/pmg.glade
}
