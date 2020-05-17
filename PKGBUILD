# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.8.0
pkgrel=3
arch=('i686' 'x86_64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz
        0001-fix-sky-in-NRFTL-MAP04-08-if-loaded-from-command-lin.patch
        0002-allow-HUD-texts-being-printed-up-to-the-right-screen.patch
        0003-NERVE.wad-Support-for-Vanilla-DOOM-2-586.patch
        0004-un-name-the-color-translation-enum.patch
        0005-restrict-game-choice-to-Doom-and-Heretic.patch)
b2sums=('f4495363216fe251566ffda6ff4dff0952661050ebb1221e536ab5a13f792b69ae4eb159f2a89b32843cc796cead43455216ddec8cc2047d44e565f0aaab302b'
        'b78423efa9402936adf40ac276e86f86742d29b5cafddbbe88937da65fdea9ff1412033a54e367c30886cbc4a433f194309bcabe9028ca9c5afc4573ecd70435'
        'b3c572f5b433e14e2316e5dd3f2be01fc14974c0ef7b81915664f3a99f8a14af5c14363b9a91820ff08f75466e55ebd82ccd37be2c38f89a0e101acd2cff0ca8'
        '0d4c1c39992b3a672830c63a80243e6344fe9c6159c97ae76e647ce563ba2a3ee6e8755f3f54e736693877e2e7ca53fe8bcde5bc09c637fb63a7d6b16020fc6b'
        'ddc440848fb6e09d6abe54d4025ec5a1c0f8f81f3d7d00d042c900fbc0d452fbec9fa472c66078679cfb2212623a7faf4ce26a7c8fc51ed293e8f84e6a02010e'
        'cd8d58c38bc2f720b29f54fb61f6222a88f8f15e5b38e887bcdda6303a6b16337468302f32f1e9c1f6248eb09d2f3b5261a10e69000b905fb1d7eef1a6589762')

prepare() {
  cd "$pkgname-$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -rf share/man/man5/default.cfg.5              \
         share/man/man5/heretic.cfg.5              \
         share/man/man6/chocolate-{server,setup}.6
}
