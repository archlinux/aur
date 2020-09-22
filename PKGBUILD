# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.9.2
pkgrel=2
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
        0001-prevent-crashes-with-simultaneous-use-of-record-and-.patch)
b2sums=('63d9a89d6099485c79ff4cad69975de790b32a4ece4bded172ebf771a2bf1b4dcd21ab58383ca3c5eea32a4eff72e65ec0e3a283c85f1bc62be680de04f88e52'
        'b1e77adf37f22f1ef47b614e27e6158ac7c19bf5b7adfa97a434b04f514a1e5cb7f1f77024a373392c836c5456c87b5bb6f7240566389574392a2e5f05d63d5d')

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
