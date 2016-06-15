# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>
pkgname=tabbed-git
_pkgname=tabbed
pkgver=0.6.29.gbc23614
pkgrel=1
pkgdesc="Simple generic tabbed fronted to xembed aware applications"
arch=('i686' 'x86_64')
url="http://tools.suckless.org/tabbed/"
license=('MIT/X')
depends=('libxft')
makedepends=('git')
provides=('tabbed')
conflicts=('tabbed')
source=("$_pkgname::git+http://git.suckless.org/tabbed")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's+[-_]+.+g'
}

prepare() {
  if [[ -f $SRCDEST/config.h ]]; then
    cp $SRCDEST/config.h $srcdir/$_pkgname/config.h
  fi
}

build() {
  cd $_pkgname
  make PREFIX=/usr
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
