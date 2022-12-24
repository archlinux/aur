# Maintainer: Daniel Mensinger <daniel@mensinger-ka.de>
_pkgname=qScan
pkgname=qscan
pkgver=1.0.2
pkgrel=1
pkgdesc="QT document scanner using SANE"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/mensinda/qScan"
license=('Apache')
groups=()
depends=(sane qt5-base imagemagick spdlog)
makedepends=(meson nlohmann-json)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    https://github.com/mensinda/$_pkgname/archive/refs/tags/v${pkgver}.tar.gz
    https://github.com/mensinda/enumGen/archive/refs/tags/v1.1.2.tar.gz # Compile time code generator
)
noextract=()
sha256sums=('68226957436a77f8ffc3a5139dbe73771c7f089a87953a7abaa7f0e8f778acf1'
            '987e608f52e651e1c90514893485331227f0064e887068124fac1a8cb96d7a8a')

prepare() {
    cp -R "enumGen-1.1.2" "$_pkgname-$pkgver/subprojects"
}

build() {
  cd "$_pkgname-$pkgver"

  arch-meson build -Dwerror=false
  meson compile -C build
}

package() {
  cd "$_pkgname-$pkgver"

  meson install -C build --destdir "$pkgdir"
}

# REMINDER: makepkg --printsrcinfo > .SRCINFO
