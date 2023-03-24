# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Sanjay Pavan <withercubes@protonmail.com>

pkgname=nsxiv
pkgver=31
pkgrel=1
pkgdesc='Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer'
arch=('x86_64')
license=('GPL2')
url='https://codeberg.org/nsxiv/nsxiv'

depends=('imlib2' 'libx11'                 # core dependencies
         'libxft' 'fontconfig' 'freetype2' # status bar
         'giflib'                          # display gif images
         'libexif'                         # display exif images
         'libwebp'                         # display webp images
         'hicolor-icon-theme')             # make icon

source=("$pkgname-$pkgver.tar.gz"::"https://codeberg.org/nsxiv/nsxiv/archive/v$pkgver.tar.gz")
sha256sums=('035fbb3fb3ffec45555afd718947ec8a7d7dfac3c5abc7ba6863cc075720d7f2')

prepare() {
  cd "$pkgname"
  [ ! -f config.h ] && cp config.def.h config.h
  # TODO: upstream this
  sed -i -e '/^install: / s|: all|:|' Makefile
}

build() {
  make -C "$pkgname" OPT_DEP_DEFAULT=1
}

package() {
  make -C "$pkgname" PREFIX=/usr DESTDIR="$pkgdir" install-all
}
