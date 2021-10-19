# Maintainer: Jakob Kretzschmar <bluefireolymp@gmail.com>

# shellcheck disable=SC2016
# shellcheck disable=SC2034
# shellcheck disable=SC2154

pkgname='pacmc'
pkgver='0.4.2'
pkgrel=1
pkgdesc='An easy to use package manager for Fabric Minecraft mods.'
arch=('any')
url='https://github.com/jakobkmar/pacmc'
license=('GPL3')
depends=('java-runtime=11')
optdepends=('minecraft-launcher: The game launcher, managing the .minecraft folder')
source=("https://github.com/jakobkmar/pacmc/releases/download/${pkgver}/pacmc-${pkgver}.tar")
sha256sums=('ecb41494a928cb24bafc21660ea30f3d2fd1d203e980f6d77a53c72bb298fc02')

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
