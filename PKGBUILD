# Maintainer: Jakob Kretzschmar <bluefireolymp@gmail.com>

# shellcheck disable=SC2034
pkgname='pacmc'
pkgver='0.3.0'
pkgrel=1
pkgdesc='An easy to use package manager for Fabric Minecraft mods.'
arch=('any')
url='https://github.com/bluefireoly/pacmc'
license=('GPL3')
depends=('java-runtime=11')
optdepends=('minecraft-launcher: The game launcher, managing the .minecraft folder')
source=("https://github.com/bluefireoly/pacmc/releases/download/${pkgver}/pacmc-${pkgver}.tar")
sha256sums=('5c7340e792c7fc0c6ce6bf495930503fa0a006a1e0a670ed0f9cee68cbc4b408')

build() {
  # shellcheck disable=SC2154
  cd "${srcdir}" || exit

  echo "#!/bin/sh" > pacmc.sh
  echo "/usr/share/${pkgname}/bin/pacmc \"\$@\"" >> pacmc.sh
}

package() {
  # shellcheck disable=SC2154
  cd "${srcdir}" || exit
  # shellcheck disable=SC2154
  install -D 'pacmc.sh' "$pkgdir/usr/bin/pacmc"

  cd "pacmc-${pkgver}" || exit
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -r '.' "$pkgdir/usr/share/${pkgname}"
}
