# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

pkgname='gopher2600'
pkgver=0.53.0
pkgrel=1
pkgdesc='Emulator for the Atari 2600 games console'
arch=('x86_64')
url='https://github.com/JetSetIlly/Gopher2600'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'libgl'
  'sdl2'
)
makedepends=('go')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  'gopher2600.desktop'
  'icon256.png'
)
sha256sums=('700c3a92bc7c7acd917aee2c229e7cf510cf8a02ccc7d34c91f23cc19850a81e'
            '5a7e3c60624007a1eb9d126097590ff869fdf66512348c5938cb53a1cccd353d'
            'a5aa462653391b3861d1c50181526830903e5c32414b62aa33ddc5675a7d713c')

build() {
  cd "${pkgname^}-${pkgver}"
  make release
}

package() {
  cd "${pkgname^}-${pkgver}"
  install -Dm755 "${pkgname}_linux_amd64" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "../gopher2600.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "../icon256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

