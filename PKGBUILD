# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.9.0
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
        0001-consider-Sigil-s-mixed-case-file-names.patch)
b2sums=('a97bb7d9bda0c4e984054a0051cadfcaba7c758829bec9e615801bbf91dc1c8063decfedf5b76056cd2fb05e8fcf4113f19c10d72604399b715011d994af3e8b'
        '0b4fa985b47924e770f8f750c8f4835c374fb689c86ef2324578835d9a8659cc32390029af73e9ac494e383750fbfaa23ceae1e81f6f87fc9f75739083cca3d6')

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
