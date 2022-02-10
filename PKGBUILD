# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.11.1
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="http://fabiangreffrath.github.io/crispy-doom"
license=('GPL2')
depends=('hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz)
b2sums=('80b67193fb3b626f22e4570a1c17de70376846464bb82103196776d8b300f0c30a38612ee6c99f0abf71a7852109c91ce5b84c49dc6810bdb093a31e347e9125')

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
         share/man/man6/chocolate-{server,setup}.6
}
