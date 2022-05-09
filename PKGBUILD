# Maintainer: Jakob Kretzschmar <dev@jakobk.de>

# shellcheck disable=SC2016,SC2034,SC2154,SC2148

pkgname="pacmc"
pkgver="0.5.0"
pkgrel=1
pkgdesc="An easy-to-use Minecraft package manager and launcher"
arch=("any")
url="https://github.com/jakobkmar/pacmc"
license=("AGPL3 or any later version")
depends=("java-runtime=11")
optdepends=("minecraft-launcher: The game launcher, managing the .minecraft folder")
source=("https://github.com/jakobkmar/pacmc/releases/download/${pkgver}/pacmc-${pkgver}.tar")
sha256sums=("f90b5773a125e99ca10423be615f805337d394561cd25bbbf4d80f37aa3459fe")

build() {
  cd "${srcdir}" || exit

  echo "#!/bin/sh" > pacmc.sh
  echo "/usr/share/${pkgname}/bin/pacmc \"\$@\"" >> pacmc.sh
}

package() {
  cd "${srcdir}" || exit
  install -D "pacmc.sh" "$pkgdir/usr/bin/pacmc"

  cd "pacmc-${pkgver}" || exit
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -r "." "$pkgdir/usr/share/${pkgname}"
}

