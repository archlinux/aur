# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=advancely
pkgver=1.5.1
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
sha256sums=('3f9216b1102064c98f6259b816977f3eb7cf2a134dfb5adfc14a95141cc7420b')

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
