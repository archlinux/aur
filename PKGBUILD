# Maintainer: uleenucks <dev@uleenucks.de>
pkgname=dwm-uleenucks-git
_pkgname=dwm
pkgdesc="dwm with uleenucks personalisations"
pkgver=6.2
pkgver(){
  cd $_pkgname
  git describe --tags |sed 's/-/./g'
}
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
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
        config.def.h.x230
        config.def.h
        compile.sh
        dwm-6.1-center.diff)

sha512sums=('SKIP'
            'acc21d9e3997936a9255e6ac3722e82af0d3ebffafb02ee96bbf61a46429a9c223587d8fb0f1801c022b6b7d10d12ace854a35c1b2fc4e44f5fb08f06c28c3b3'
            'ebf52693f4e55fc2cac9a8505687826a06deb968b68fad55cb52592620602889c4e48e0ec40a9df8ed617deca646b939fd060bb6eb110f91868fdec10d1d285a'
            'ebf52693f4e55fc2cac9a8505687826a06deb968b68fad55cb52592620602889c4e48e0ec40a9df8ed617deca646b939fd060bb6eb110f91868fdec10d1d285a'
            'cd68cc7d70f9d857219c5f7cf2056ec10018579332fb30fe5ef2e92effe84fc7a9439e55ea165e97ca1a909247a0ddb3a6de35ba8f8688f32e2c15bf2c124d50'
            '383a79385d6444ff503d1a81ed13a52db06d253857a8ee955ab0ef669df6e6da501cc0e35a2549472f271684de13de3a3fb2d6843cd596842f9fbc0e0ad53d66')

prepare() {
  cd $_pkgname

  ln -sf ../config.def.h config.h
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
