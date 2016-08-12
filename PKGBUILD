pkgname=dwm-uleenucks-git
_pkgname=dwm
pkgdesc="dwm with uleenucks personalisations"
pkgver=6.1.5.g56a31dc
pkgver(){
  cd $_pkgname
  git describe --tags |sed 's/-/./g'
}
pkgrel=4
pkgdesc="A dynamic window manager for X"
url="https://git.uleenucks.de/builds/"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
install=dwm.install
provides=('dwm')
conflicts=('dwm')
replaces=('dwm')
epoch=1
source=("$_pkgname::git+http://git.suckless.org/dwm"
        config.def.h.x200s
        config.def.h.work
        compile.sh
        dwm-6.1-center.diff)

md5sums=('SKIP'
         '53acc5aead54700e3709e0d33fe5d252'
         'ac89a24396a42dee2922c06d31388c5e'
         '2fb39fa984c6676363051d0bafc74dc6'
         '5f6f840c692f43f7e349bb87e895ff26')

prepare() {
  if [[ -f $SRCDEST/config.def.h ]]; then
    ln -sf $SRCDEST/config.def.h $srcdir/dwm/config.h
  fi
}

build() {
  cd $_pkgname

  patch -p1 < ../dwm-6.1-center.diff || exit 1
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  make -C $_pkgname PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D $_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D $_pkgname/README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
