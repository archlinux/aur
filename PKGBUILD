# Maintainer:  TDY <tdy@archlinux.info>

pkgname=echinus-git
pkgver=0.4.9.r31.g2acd233
pkgrel=1
pkgdesc="A window manager for X in the spirit of dwm"
arch=('i686' 'x86_64')
url="http://plhk.ru/echinus"
license=('MIT')
depends=('libxft' 'libxrandr')
makedepends=('git' 'pkgconfig')
optdepends=('ourico: complementary taskbar for echinus')
provides=('echinus')
conflicts=('echinus')
install=echinus.install
source=($pkgname::git://github.com/polachok/echinus.git
        echinus.desktop)
md5sums=('SKIP'
         '3dbc8f89200dcb8b3e44144602172c49')

pkgver() {
  cd $pkgname
  git tag -a -m "Release 0.4.9" 0.4.9 5786ee16a2281ec3a782a99824e5ad15cda7ec77 || :
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make PREFIX=/usr X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" CONF=/share/echinus/examples install
  install -Dm644 echinus.1 "$pkgdir/usr/share/man/man1/echinus.1"
  install -Dm644 README "$pkgdir/usr/share/doc/echinus/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../echinus.desktop \
    "$pkgdir/usr/share/xsessions/echinus.desktop"
}

# vim:set ts=2 sw=2 et:
