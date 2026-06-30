# Maintainer: Kelsey <kelsey at the-dreamer dot dev>

pkgname=mewo
pkgver=1.0.0
pkgrel=1
pkgdesc="Mewo sprite that meows when clicked (Wayland)"
arch=('x86_64')
url="https://codeberg.org/kelseythedreamer/headspace-repo"
license=('GPL2')
depends=('sdl2' 'sdl2_image')
makedepends=('clang' 'pkg-config')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/games-misc/mewo/files/mewo-${pkgver}.tar.gz"
        "mewo.desktop::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/games-misc/mewo/files/mewo.desktop")
sha256sums=('968684d76cf29520dfa079901ad9acce4f266340df586c80d879c9356b1e38af'
            '4273a656da4caff95a9f98eff6eacf4a889e5887df68a019997df9400fdb6278')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  clang++ -std=c++17 -O2 \
    -DDATA_DIR='"/usr/share/mewo"' \
    main.cpp -o mewo \
    $(pkg-config --cflags --libs sdl2 SDL2_image)
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 mewo "${pkgdir}/usr/bin/mewo"
  install -Dm644 mewo_0.qoi "${pkgdir}/usr/share/mewo/mewo_0.qoi"
  install -Dm644 mewo_1.qoi "${pkgdir}/usr/share/mewo/mewo_1.qoi"
  install -Dm644 sfx.wav "${pkgdir}/usr/share/mewo/sfx.wav"
  install -Dm644 mewo.png "${pkgdir}/usr/share/pixmaps/mewo.png"
  install -Dm644 "${srcdir}/mewo.desktop" "${pkgdir}/usr/share/applications/mewo.desktop"
}
