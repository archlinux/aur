# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Build template: https://build.opensuse.org/package/show/games/dave_gnukem

pkgname=dave_gnukem
pkgver=1.0.1
pkgrel=2
pkgdesc='2D scrolling platform shooter inspired by Duke Nukem 1'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/davidjoffe/dave_gnukem'
license=('GPL2' 'MIT')
depends=('sdl_mixer')
source=("${url}/archive/${pkgver}.tar.gz"
        "${pkgver}-data.tar.gz::https://github.com/davidjoffe/gnukem_data/archive/${pkgver}.tar.gz"
        "${pkgname}-wrapper.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('2f00a6c373e270578160a73a5484fb8ec92a9361c7960cb4670856bcdc7a8a14'
            '46c06c5fb7e1ca8d0848c1866d6e1df96e021ddf8cebc7e64d97cfee64232027'
            'bdfa7b607418497e6f1448fe6bf407bd4a22fcea5efefedfeda90607566bf7d4'
            'baf54018ab7a1b7607b2e726561d2c2ea2c62f7ce12e5056aac9d5b613536fb6'
            '07c150d5fe3cdad974917350ccf4d706eadaf847c5bf49248ef8748ec50c1350')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  install -Dm755 "${pkgname}-wrapper.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -d "${pkgdir}/usr/share/${pkgname}/data"
  mv "gnukem_data-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}/data"

  install -Dm755 "${pkgname}-${pkgver}/davegnukem" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE"
}

# vim: ts=2 sw=2 et: