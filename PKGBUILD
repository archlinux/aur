# Maintainer: Jakob Kretzschmar <bluefireolymp@gmail.com>

# shellcheck disable=SC2016
# shellcheck disable=SC2034
# shellcheck disable=SC2154

pkgname='pacmc'
pkgver='0.4.0'
pkgrel=1
pkgdesc='An easy to use package manager for Fabric Minecraft mods.'
arch=('any')
url='https://github.com/bluefireoly/pacmc'
license=('GPL3')
depends=('java-runtime=11')
optdepends=('minecraft-launcher: The game launcher, managing the .minecraft folder')
source=("https://github.com/bluefireoly/pacmc/releases/download/${pkgver}/pacmc-${pkgver}.tar")
sha256sums=('3432df16f2ec08b3e5c5a4f892baed482f03836d42c0f87b6eba18f80b9f9d7d')

build() {
  cd "${srcdir}" || exit

  echo "#!/bin/sh" > pacmc.sh
  echo "/usr/share/${pkgname}/bin/pacmc \"\$@\"" >> pacmc.sh
}

package() {
  cd "${srcdir}" || exit
  install -D 'pacmc.sh' "$pkgdir/usr/bin/pacmc"

  cd "pacmc-${pkgver}" || exit
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -r '.' "$pkgdir/usr/share/${pkgname}"
}
