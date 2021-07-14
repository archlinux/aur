# Maintainer: Jakob Kretzschmar <bluefireolymp@gmail.com>

# shellcheck disable=SC2034
pkgname='pacmc'
pkgver='0.2.2'
pkgrel=1
pkgdesc='An easy to use package manager for Fabric Minecraft mods.'
arch=('any')
url='https://github.com/bluefireoly/pacmc'
license=('GPL3')
depends=('java-runtime=11')
optdepends=('minecraft-launcher: The game launcher, managing the .minecraft folder')
source=("https://github.com/bluefireoly/pacmc/releases/download/${pkgver}/pacmc-${pkgver}.tar")
sha256sums=('8ba2e51682e2e76962235c390d80858fef78b91ce775f83a4a4bf1a805d7bd58')

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
