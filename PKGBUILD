# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Maintainer: Konstantin Stepanov <me@kstep.me>

pkgname=st-solarized-powerline
pkgver=0.6
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X with patched for solarized dark and powerline'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft' 'ttf-dejavu-sans-mono-powerline-git')
makedepends=('ncurses')
conflicts=('st')
url="http://st.suckless.org"
source=(http://dl.suckless.org/st/st-$pkgver.tar.gz
        config.h
        patch.diff)
md5sums=('1a926f450b4eacb7e2f5ac5b8ffea7c8'
         'faf813f28dfd6d91ca45fb425dd5a15e'
         '3a78e4a441b4a7a63e770e73919102a9')

build() {
  cd $srcdir/st-$pkgver
  patch -p0 < $srcdir/patch.diff
  cp $srcdir/config.h config.h
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/st-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/st/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/st/README"
}
