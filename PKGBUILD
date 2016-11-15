# Maintainer: Michael Straube <michael_straube@web.de>

pkgname=megamario
pkgver=1.7
pkgrel=1
pkgdesc="A Super Mario Bros. clone"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mmario"
license=('LGPL')
depends=('sdl_ttf' 'sdl_image' 'sdl_mixer' 'mesa')
makedepends=('glu')
source=("http://downloads.sourceforge.net/mmario/MegaMario_v${pkgver}_full.zip"
        "fix-compile-error.patch"
        "fix-mp3-path.patch"
        "fix-logfile-path.patch")
sha1sums=('71d777f06109a157ad0df7612cca02d8fe462538'
          '7339e7d728a0dd4eb0ee9bbb3d508a64ea13794e'
          '0d0d7fd3625d4f0c42dcc113483882a8732c154f'
          'fbc7b86caabf5985ce32ec58861bc110363c74ae')

prepare() {
  patch -p0 -i "$srcdir"/fix-compile-error.patch
  patch -p0 -i "$srcdir"/fix-mp3-path.patch
  patch -p0 -i "$srcdir"/fix-logfile-path.patch
}

build() {
  make PREFIX=/usr
}

package() {
  make PREFIX="$pkgdir"/usr install

  cp -r mp3music "$pkgdir"/usr/share/megamario

  install -Dm644 megamario.desktop "$pkgdir"/usr/share/applications/megamario.desktop
  install -Dm644 megamario.png "$pkgdir"/usr/share/pixmaps/megamario.png
}
