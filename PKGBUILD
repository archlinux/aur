# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=sludge
pkgver=2.2.2
pkgrel=2
pkgdesc="An engine and development kit for the creation of 2D adventure games."
arch=(i686 x86_64)
url="http://opensludge.sourceforge.net/"
license=('GPL3' 'LGPL')
depends=('glee' 'alure' 'libvpx' 'gtkglext' 'sdl' 'dumb' 'desktop-file-utils')
install="$pkgname.install"
source=("https://github.com/opensludge/opensludge/releases/download/$pkgver/$pkgname-$pkgver-source.tar.gz"
        "3e28a8f152594a5bf0e55c9f17bfcab483d64ab1.patch")
sha256sums=('b8a0504993770b7a931905cc697834bd03b908f0f9b96fe9a1059d6621cf5176'
            'bcdad85c68fc3347a3482cd02719e7edb801d514c073617b9b2836738ace0fef')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../3e28a8f152594a5bf0e55c9f17bfcab483d64ab1.patch
}

build() {
  cd $pkgname-$pkgver
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
