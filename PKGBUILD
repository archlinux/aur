# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=bdsup2subpp-git
pkgver=1.0.3.34.g48e0395
pkgrel=1
pkgdesc="Subtitle conversion tool for image based stream formats with scaling capabilities and some other nice features. (GIT version)"
arch=('x86_64')
license=('Apache')
url='http://forum.doom9.org/showthread.php?t=167051'
depends=('qt5-base')
makedepends=('git'
             'meson'
             'qt5-tools'
             )
provides=('bdsup2subpp')
conflicts=('bdsup2subpp')
source=('bdsup2subpp::git+https://github.com/TheGreatMcPain/BDSup2SubPlusPlus.git')
sha256sums=('SKIP')

pkgver() {
  cd bdsup2subpp
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  sed 's|bdsup2sub++|bdsup2subpp|g' \
    -i bdsup2subpp/meson.build \
    -i bdsup2subpp/bundle/linux/bdsup2sub++.desktop
}

build() {
  cd build
  arch-meson ../bdsup2subpp \
    --prefix /usr

  ninja
}

package() {
  install -Dm755 build/bdsup2subpp "${pkgdir}/usr/bin/bdsup2subpp"

  install -Dm644 bdsup2subpp/bundle/linux/bdsup2sub++.desktop "${pkgdir}/usr/share/applications/bdsup2subpp.desktop"
  install -Dm644 bdsup2subpp/bundle/linux/bdsup2subpp.png "${pkgdir}/usr/share/pixmaps/bdsup2subpp.png"
}
