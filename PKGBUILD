# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Robert Timm <mail@rtti.de>

pkgname=vimb
pkgver=3.3.0
pkgrel=2
epoch=
arch=('i686' 'x86_64')
pkgdesc="The vim like browser"
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkit2gtk>=2.8', 'pkgconf')
provides=('vimb')
conflicts=('vimb2' 'vimb-gtk2' 'vimb-git')
source=('vimb-3.3.0.tar.gz::https://github.com/fanglingsu/vimb/archive/3.3.0.tar.gz')
md5sums=('b6e69c0efc5546bdc91453741ff25a90')
sha256sums=('5c6fe39b1b2ca18a342bb6683f7fd5b139ead53903f57dd9eecd5a1074576d6c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  if [ -e $SRCDEST/config.h ]; then
    msg "Using custom config.h";
    cp $SRCDEST/config.h "$srcdir/$pkgname/src"
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DEXTENSIONDIR=/usr/lib/vimb V=1 DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DEXTENSIONDIR=/usr/lib/vimb V=1 DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
