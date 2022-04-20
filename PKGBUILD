# Maintainer: Loris Lucido <dindon at zaclys dot net>
# Contributor: Cloudef <mailroxas _at_ gmail _dot_ com>
# Lightweight clipboard manager for X

_gitname=xcmenu
pkgname=xcmenu-git
pkgver=20140816.23
pkgrel=1
pkgdesc='Lightweight clipboard manager for X'
arch=('i686' 'x86_64')
url='https://github.com/dindon-sournois/xcmenu'
license=('WTFPL')
depends=('libxcb' 'zlib')
optdepends=('dmenu')
makedepends=('gcc')
replaces=('loliclip')
source=(git+https://github.com/dindon-sournois/xcmenu.git)
md5sums=(SKIP)

pkgver() {
   cd "$srcdir/$_gitname"
   echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
   cd "$srcdir/$_gitname"

   # Allow custom FLAGS
   sed -i config.mk -e 's|^CFLAGS\s*=|CFLAGS +=|' -e 's|^LDFLAGS\s*=|LDFLAGS +=|'

   # custom config
   if [[ -e "$startdir/config.h" ]]; then
      msg "using custom config.h";
      cp "$startdir/config.h" .
   fi

   make
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=8 sw=3 tw=0 :
