# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=sdlpop
pkgver=1.17
pkgrel=1
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("sdlpop-$pkgver.tar.gz::https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "sdlpop.desktop"
        "sdlpop.sh")
sha256sums=('aa4b254ab80b889a6db491b41c4f83467124d932cc0836e5979fa73b6c49a94d'
            '39ec3eb4cd4021424b4ee35b5cc68ca3735894369be5622f1825cf0ad2c21f6f'
            '08275c83ec0f19484b90b88a7a31cca2f4503d1cba11a02f1cf97ac4fec67475')

build() {
  cd SDLPoP-$pkgver/src
  make
}

package() {
  cd SDLPoP-$pkgver
  install -d "$pkgdir"/usr/{lib/sdlpop,share/sdlpop}
  install -m755 prince "$pkgdir"/usr/lib/sdlpop
  cp -r data doc mods SDLPoP.ini "$pkgdir"/usr/share/sdlpop
  install -Dm755 ../sdlpop.sh "$pkgdir"/usr/bin/prince
  install -Dm644 ../sdlpop.desktop "$pkgdir"/usr/share/applications/sdlpop.desktop
}
