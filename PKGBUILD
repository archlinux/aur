# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Robert Timm <mail@rtti.de>

pkgname=vimb
pkgver=3.0.0.1
pkgrel=1
epoch=
arch=('i686' 'x86_64')
pkgdesc="The vim like browser"
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkit2gtk>=2.8')
provides=('vimb')
conflicts=('vimb2' 'vimb-gtk2' 'vimb-git')
source=('vimb-3.0.0.tar.gz::https://github.com/fanglingsu/vimb/archive/3.0-alpha.tar.gz')
md5sums=('feb013e251eccf2a1b8a7728dd0816e1')
sha256sums=('0cf8f6226d2471bf43d8ee969f00dedab048601aa869f1d190c1ed47c0acbfe2')

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
