# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=sludge
pkgver=2.2.1
pkgrel=2
pkgdesc="An engine and development kit for the creation of 2D adventure games."
arch=(i686 x86_64)
url="http://opensludge.sourceforge.net/"
license=('GPL3' 'LGPL')
depends=('glee' 'alure' 'libvpx' 'gtkglext' 'sdl' 'dumb' 'desktop-file-utils')
makedepends=('automake-1.14')
install="$pkgname.install"
source=("https://github.com/opensludge/opensludge/releases/download/$pkgver/$pkgname-$pkgver-source.tar.gz" "0001-configure.ac-use-PKG_CHECK_MODULES-for-libvpx.patch")
sha256sums=('c64d45a7b7d1bf26993247b6dcddbca3440c1c68393e0542ff1f869b2bc1f735' '1ea24bd991cad769585cdb336e6a7bdf8cecc79416b3a55629a83ab1cba11972')

build() {
  cd $pkgname-$pkgver
  patch -p1 < ../0001-configure.ac-use-PKG_CHECK_MODULES-for-libvpx.patch
  ./configure --prefix=/usr \
              --enable-devkit \
              --enable-doc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
