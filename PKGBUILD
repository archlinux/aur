# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=galapix
pkgver=0.2.1
pkgrel=1
pkgdesc="A zoomable image viewer for large collections of images"
arch=('i686' 'x86_64')
url="http://code.google.com/p/galapix/"
license=('GPL3')
depends=('curl' 'glew' 'imagemagick' 'libexif' 'libjpeg' 'libpng' 'mesa' 'sdl' 'sqlite3')
makedepends=('scons' 'patch' 'gtkglextmm' 'libglademm' 'boost')
optdepends=('xcftools: XCF format support'
            'gimp-ufraw: RAW format support')
source=(http://galapix.googlecode.com/archive/$pkgname-$pkgver.tar.gz
        imagemagick_plugin.patch png_string_fix.patch)
md5sums=('d58ef6c5e1f51efe37886a734750b9d5'
         '9f2397caa6bea257ca0cd09a31f96dbf'
         '34f0386d3247edc62e3ff4e55892d286')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver
  patch -Np0 -i "${srcdir}"/imagemagick_plugin.patch
  patch -Np0 -i "${srcdir}"/png_string_fix.patch
}

build() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver
  scons
}

package() {
  cd "${srcdir}"/$pkgname-$pkgname-$pkgver
  install -Dm755 build/$pkgname.sdl "${pkgdir}"/usr/bin/$pkgname
}
