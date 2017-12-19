# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Robert Timm <mail@rtti.de>

pkgname=vimb
pkgver=3.1.0
pkgrel=1
epoch=
arch=('i686' 'x86_64')
pkgdesc="The vim like browser"
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkit2gtk>=2.8')
provides=('vimb')
conflicts=('vimb2' 'vimb-gtk2' 'vimb-git')
source=('vimb-3.1.0.tar.gz::https://github.com/fanglingsu/vimb/archive/3.1.0.tar.gz')
md5sums=('52b28e286a2529407684d9f221279822')
sha256sums=('6efc32b81759b1dfc637b5188831a787902ae296150a12b2813f6cc190009abf')

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
