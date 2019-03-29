# Contributor: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Maintainer: Robert Timm <mail@rtti.de>

pkgname=vimb
pkgver=3.4.0
pkgrel=1
epoch=
arch=('i686' 'x86_64')
pkgdesc="The vim like browser"
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkit2gtk>=2.20', 'pkgconf')
provides=('vimb')
conflicts=('vimb2' 'vimb-gtk2' 'vimb-git')
source=("vimb-$pkgver.tar.gz::https://github.com/fanglingsu/vimb/archive/$pkgver.tar.gz" 0001-Makefile-fix-compilation-if-source-is-not-in-a-git-r.patch)
md5sums=('befacbb3089627a516cf8f12ac389b98' '0899d1692c08b261bc576ed354acf797')
sha256sums=('36838f509a2ec55515eaf51bbe8c4885f3ef20847f0f42d36103dcfddaf5b39a' '15b6fedc1612088d74e8699dac440ffa0ae80ed81a93c5d871437b521236563d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  if [ -e $SRCDEST/config.h ]; then
    msg "Using custom config.h";
    cp $SRCDEST/config.h "$srcdir/$pkgname/src"
  fi
  patch -Np1 < ../../0001-Makefile-fix-compilation-if-source-is-not-in-a-git-r.patch
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
