# Contributor: royrocks <royrocks13@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-git
pkgver=3470.1c312023
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A free drawing program designed for young children. Checkout from git"
url="http://www.newbreedsoftware.com/tuxpaint/"
license=('GPL')
depends=('sdl' 'libpaper' 'hicolor-icon-theme' 'librsvg' 'python' 'libimagequant'
	 'sdl_ttf' 'sdl_pango' 'sdl_mixer' 'sdl_image' 'fontforge' 'sdl_gfx')
provides=('tuxpaint')
conflicts=('tuxpaint')
makedepends=('git' 'gperf' 'awk')
options=('!makeflags')
source=("git+https://git.code.sf.net/p/tuxpaint/tuxpaint" Makefile.patch)
sha256sums=('SKIP'
            '00b58c7003bf21a0aa17032fa5f642ae8b0f9c2f760f44753cc5f85ab87891c3')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "${pkgname%-git}"
  git apply "$srcdir"/Makefile.patch
}

build() {
  cd "${pkgname%-git}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir"/usr/share/icons/hicolor
  install -Dm644 src/tuxpaint.desktop "$pkgdir"/usr/share/applications/tuxpaint.desktop
  make DESTDIR="$pkgdir" PREFIX=/usr install 
  rm -rf "$pkgdir"/usr/share/tuxpaint/CVS
  rm -rf "$pkgdir"/usr/X11R6 
} 
