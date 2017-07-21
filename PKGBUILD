# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Robert Timm <mail@rtti.de>

pkgname=vimb
pkgver=3.0.0.r1466.5bca294
pkgrel=1
epoch=
arch=('i686' 'x86_64')
pkgdesc="The vim like browser"
url="https://github.com/fanglingsu/vimb"
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkit2gtk>=2.8')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('vimb')
conflicts=('vimb2' 'vimb-gtk2' 'vimb-git')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/fanglingsu/vimb.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "3.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  if [ -e $SRCDEST/config.h ]; then
    msg "Using custom config.h";
    cp $SRCDEST/config.h "$srcdir/$pkgname/src"
  fi
}

build() {
  cd "$srcdir/$pkgname"
  make DEXTENSIONDIR=/usr/lib/vimb V=1 DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  make DEXTENSIONDIR=/usr/lib/vimb V=1 DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
