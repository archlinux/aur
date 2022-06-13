# Maintainer: tommis <tommi@saira.fi>

pkgname=dragit
pkgver=0.6.2
pkgrel=1
pkgdesc='Application for intuitive file sharing between devices.'
arch=('any')
depends=('gtk3')
makedepends=('cargo' 'rust')
url='https://github.com/sireliah/dragit'
license=('GPL3')
source=("https://github.com/sireliah/dragit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e58c6d7a1d2b1067a84b4aa0b225433f06c1f73f2c3765f20d3275bf5d10f4c8')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m 755               \
    "target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 dragit.desktop \
                "${pkgdir}/usr/share/applications/dragit.desktop"
  install -D -m 644 static/logo_icon_t_256x256.png \
                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.sireliah.Dragit.png"
  install -D -m 644 \
    LICENSE         \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

