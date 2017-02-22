# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=sdlpop
pkgver=1.17
pkgrel=2
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
makedepends=('gendesk')
source=("sdlpop-$pkgver.tar.gz::https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "sdlpop.sh")
sha256sums=('aa4b254ab80b889a6db491b41c4f83467124d932cc0836e5979fa73b6c49a94d'
            '08275c83ec0f19484b90b88a7a31cca2f4503d1cba11a02f1cf97ac4fec67475')

prepare() {
  gendesk -n --pkgname=$pkgname --name=SDLPoP --comment="$pkgdesc" \
    --exec=prince --categories="Application;Game;ArcadeGame"
}

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
  install -Dm644 "$pkgdir"/usr/share/sdlpop/data/icon.png "$pkgdir"/usr/share/pixmaps/sdlpop.png
}
