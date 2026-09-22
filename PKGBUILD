# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=advancely
pkgver=1.7.2
pkgrel=1
pkgdesc="A highly customizable and interactive tool to track Minecraft progress."
arch=('x86_64')
url="https://github.com/LNXSeus/Advancely"
license=('LicenseRef-Proprietary')
depends=(sdl3 sdl3_image sdl3_ttf curl)
makedepends=(git cmake python-jsonschema python-jinja)
provides=('advancely')
conflicts=('advancely-bin' 'advancely-git')
source=("git+$url#tag=v${pkgver}")
sha256sums=('74f25e8e227bab61dbbe48b212831645a9bd86b3c062dd85d598ae0c132ca2cf')

build() {
  cd "$srcdir/Advancely"

  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --config Release
}

package() {
  cd "$srcdir/Advancely"

  DESTDIR="$pkgdir" cmake --install build

  install -D -m 644 LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
