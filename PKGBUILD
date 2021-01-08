# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=5.9.2
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
        0001-prevent-crashes-with-simultaneous-use-of-record-and-.patch
        0002-Support-widescreen-assets.-674.patch
        0003-force-status-bar-refresh-in-the-Main-Episode-and-Ski.patch)
b2sums=('63d9a89d6099485c79ff4cad69975de790b32a4ece4bded172ebf771a2bf1b4dcd21ab58383ca3c5eea32a4eff72e65ec0e3a283c85f1bc62be680de04f88e52'
        '3a48523211db97019993bf57dcecb376872a2858f6d482ca4210444ef7f25337d88f44bd4eeac01ed60d024521ffcfe027b0a39006c7c643c9c6cf004b2808f1'
        'ca952dc981b520bc30871f34e9e02c0697c9a7700fd502f30cef0fee4c86ee77b8b5563b3815bf8749ed5f3e8961443699ad0f25e7f9a71f3a39a9f0c2e98067'
        '4dfa31e71a5ea7c2de31e2b1b8caf888832487f774a62f7012909b459bff048738828a2ed721367decddeb02688e7765062127ae44e34f4c24c1e6f2cf24c321')

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
