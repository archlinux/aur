# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='dave_gnukem'
pkgver=1.0.1
pkgrel=3
pkgdesc='2D scrolling platform shooter inspired by Duke Nukem 1'
arch=('x86_64')
url='https://github.com/davidjoffe/dave_gnukem'
license=('GPL2' 'MIT')
depends=('hicolor-icon-theme' 'sdl_mixer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-data.tar.gz::${url%/*}/${pkgname#*_}_data/archive/${pkgver}.tar.gz"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('2f00a6c373e270578160a73a5484fb8ec92a9361c7960cb4670856bcdc7a8a14'
            '46c06c5fb7e1ca8d0848c1866d6e1df96e021ddf8cebc7e64d97cfee64232027'
            'bdfa7b607418497e6f1448fe6bf407bd4a22fcea5efefedfeda90607566bf7d4'
            '3e15644441db9586421c95879d7d9eb68c03fe204f43c3fbd744ac80431b4a91'
            '89cb35bd13682bb35f2e7e5a9fc36d0a0f9959b77261d538f8ab1d59edb0321e')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${pkgname}.png"

  install -d "${pkgdir}/usr/share/${pkgname}/data"
  mv -f "${pkgname#*_}_data-${pkgver}"/* "${pkgdir}/usr/share/${pkgname}/data"

  install -Dm755 "${pkgname}-${pkgver}/${pkgname/_/}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
