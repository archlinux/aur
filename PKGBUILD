# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# 04-Oct-2026
#

pkgname=cevomapgen
pkgver=44
pkgrel=1
pkgdesc="External Random Map Generator for C-evo"
arch=('x86_64' 'aarch64')
url="https://git.code.sf.net/p/$pkgname/code"
license=('GPL-3.0-or-later')
depends=('qt6pas' 'glibc' 'libx11' 'hicolor-icon-theme')
makedepends=('fpc' 'lazarus-qt6')
source=(https://sourceforge.net/projects/$pkgname/files/Source/$pkgname-$pkgver.tar.xz)
# source=("$pkgname-$pkgver".tar.xz)
sha256sums=('d8940c0535a598b5fcd4ea1d005f21092644c3ed6da5b14b4b267ae93eaf82b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make -B LAZDIR=--lazarusdir=/usr/lib/lazarus all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install
  
# Copy ref doc to where the GUI looks for it  
  mkdir "$pkgdir/"usr/share/doc/c-evo-map-gen
  cp -v "$pkgdir/"usr/share/doc/cevomapgen/Reference.html "$pkgdir/"usr/share/doc/c-evo-map-gen/Reference.html
}
