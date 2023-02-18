# Maintainer: spider-mario <spidermario@free.fr>

pkgname=sdlpop
pkgver=1.23
pkgrel=1
pkgdesc="An open-source port of Prince of Persia"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/NagyD/SDLPoP"
depends=('sdl2_image' 'sdl2_mixer')
source=("sdlpop-$pkgver.tar.gz::https://github.com/NagyD/SDLPoP/archive/v$pkgver.tar.gz"
        "sdlpop.sh")
b2sums=('dfb3a1730622cf4ab6535d6a29b027cc601ab8a611ae40663cf5fd3eb632f2b1fb633c845f1978ccddb5a19d98e809dbb43ea82bddc5f789ef7416d54265a7bb'
        'eecce7df11ff08547fb79f3fdcfffaddb84c2c112f200f12d2bb748c0ac498bcb5e0ab42ecaff1420eca883d7d83e58a0c0ce54abcaceb645ca914c06e2bed10')

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
