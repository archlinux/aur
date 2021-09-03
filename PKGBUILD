# Maintainer: Jakob Kretzschmar <bluefireolymp@gmail.com>

# shellcheck disable=SC2016
# shellcheck disable=SC2034
# shellcheck disable=SC2154

pkgname='pacmc'
pkgver='0.4.1'
pkgrel=1
pkgdesc='An easy to use package manager for Fabric Minecraft mods.'
arch=('any')
url='https://github.com/jakobkmar/pacmc'
license=('GPL3')
depends=('java-runtime=11')
optdepends=('minecraft-launcher: The game launcher, managing the .minecraft folder')
source=("https://github.com/jakobkmar/pacmc/releases/download/${pkgver}/pacmc-${pkgver}.tar")
sha256sums=('1e1a4cb7369e78de2267dd9ed186896c9ce172c27d073a3382c91d6e67bd0380')

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
