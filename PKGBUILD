# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=6.0
pkgrel=2
arch=('i686' 'x86_64' 'aarch64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('fluidsynth' 'hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz)
b2sums=('fc864ae55100db0d074d14eae795bd603b355fba8eaa783b564b167cf1bf65ff1e97f4640d2b0d56f8c4ec076125fd0f0e2a95bc5eac7251997e9f7757f4d295')

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
         share/man/man5/hexen.cfg.5                \
         share/man/man5/strife.cfg.5               \
         share/man/man6/chocolate-{server,setup}.6
}
