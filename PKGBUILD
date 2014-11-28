# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=galapix
pkgver=0.1.2
pkgrel=1
pkgdesc="A zoomable image viewer for large collections of images"
arch=('i686' 'x86_64')
url="http://code.google.com/p/galapix/"
license=('GPL3')
depends=('boost' 'curl' 'glew' 'imagemagick' 'libexif' 'libjpeg' 'libpng' 'mesa' 'sdl' 'sqlite3')
makedepends=('scons' 'patch' 'gtkglextmm' 'libglademm')
source=(http://galapix.googlecode.com/files/$pkgname-$pkgver.tar.bz2 \
        $pkgname-gcc44.patch)
md5sums=('f55fa7c87dabe132b3493220fa0d9d8d'
         '8189e68e656a82e890242395416f9e34')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -Np1 -i ${srcdir}/$pkgname-gcc44.patch

  scons
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  install -D -m755 build/$pkgname.sdl ${pkgdir}/usr/bin/$pkgname
}
