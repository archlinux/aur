# Maintainer: spider-mario <spidermario@free.fr>

pkgname=sdlpop
pkgver=1.19
pkgrel=1
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("sdlpop-$pkgver.tar.gz::https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "sdlpop.sh")
sha256sums=('e43e3a215e1377d74375fc06183cda76195328a0348a980a5991f3648bb91be2'
            'cb7b7923dcfb68520c7e738e6e8bd503f56f2775b28022285397284c0c428991')

prepare() {
  cd SDLPoP-$pkgver/src
  sed -e 's|$ROOT|/opt/sdlpop|' SDLPoP.desktop.template > SDLPoP.desktop
}

build() {
  cd SDLPoP-$pkgver/src
  export CFLAGS+=" $CPPFLAGS"
  make
}

package() {
  cd SDLPoP-$pkgver
  # world-writable for save/load games, config, etc.
  install -dm757 "$pkgdir"/opt/sdlpop
  install -m755 prince "$pkgdir"/opt/sdlpop
  cp -r data doc mods SDLPoP.ini "$pkgdir"/opt/sdlpop
  install -Dm755 ../sdlpop.sh "$pkgdir"/usr/bin/prince
  install -Dm644 src/SDLPoP.desktop "$pkgdir"/usr/share/applications/sdlpop.desktop
}
