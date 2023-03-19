# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=bdsup2subpp-git
pkgver=1.0.3.37.g5f8c159
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
source=('bdsup2subpp::git+https://github.com/amichaeltm/BDSup2SubPlusPlus.git'
        'https://raw.githubusercontent.com/TheGreatMcPain/BDSup2SubPlusPlus/meson/meson.build'
        )
sha256sums=('SKIP'
            'f20112aaccf38ee97b35a183182728ac3ecf58dd5b168ae7bac2432a59569417'
            )

pkgver() {
  cd bdsup2subpp
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cp "${srcdir}/meson.build" bdsup2subpp/meson.build

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
