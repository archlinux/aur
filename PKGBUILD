# Maintainer: BeChris (gmail)

pkgname=domino-chain
pkgver=1.1
pkgrel=1
pkgdesc="Clone of the puzzle game Pushover (Amiga)."
arch=('i686' 'x86_64')
url="https://domino-chain.gitlab.io/"
license=('GPL3')
depends=('boost-libs' 'fribidi' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libpng' 'lua52' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'zlib')
makedepends=('boost' 'git' 'gnu-free-fonts' 'imagemagick' 'povray' 'shellcheck')
source=("$pkgname::git+https://gitlab.com/domino-chain/domino-chain.gitlab.io.git#tag=${pkgver}"
        "path-to-fonts.patch"
        "$pkgname.desktop")

prepare() {
  patch -Np1 -i "$srcdir/path-to-fonts.patch"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('SKIP'
         'f02b1107acd16f962eee2d8aa8fb6875'
         '4ac36ca43ea455b5c251ec4558d83162')

