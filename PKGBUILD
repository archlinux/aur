# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=megamario
pkgver=1.7
pkgrel=2
pkgdesc="A Super Mario Bros. clone"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mmario"
license=('LGPL')
depends=('sdl_ttf' 'sdl_image' 'sdl_mixer' 'mesa')
makedepends=('glu')
source=("https://downloads.sourceforge.net/mmario/MegaMario_v${pkgver}_full.zip"
        "megamario-fix-compile-error.patch"
        "megamario-fix-mp3-path.patch"
        "megamario-fix-logfile-path.patch")
sha256sums=('243ebf03cb1e5c5e7cead48d9a988ffb9a1c94f9427f71ea559ad047486c9e72'
            '2665b31e5014868a4df71f4e0565dac4c50b703f9d539be8ee1d24688fdde070'
            'ff1286986ca125b888802e205f5291e3a30ccd15433744e9fa18fd1ec0ee9e2f'
            '02361dd4bc005d13d6010d42179b1aaa3d4ea6bd8a02f47ddf8b10ea4215bd34')

prepare() {
  patch -p0 -i megamario-fix-compile-error.patch
  patch -p0 -i megamario-fix-mp3-path.patch
  patch -p0 -i megamario-fix-logfile-path.patch
}

build() {
  make PREFIX=/usr
}

package() {
  make PREFIX="$pkgdir"/usr install

  cp -r mp3music "$pkgdir"/usr/share/megamario

  install -Dm644 megamario.desktop "$pkgdir"/usr/share/applications/megamario.desktop
  install -Dm644 megamario.png "$pkgdir"/usr/share/pixmaps/megamario.png

  install -m644 CONTROLS.txt readme.txt "$pkgdir"/usr/share/megamario
}
