# Maintainer: Ben Towali <ben@bentowali.com>

pkgname=raindrop
pkgver='5.7.6'
pkgrel=1
pkgdesc="All-in-one bookmark manager"
arch=('x86_64' 'aarch64')
url="https://raindrop.io"
license=('MIT')
depends=()
makedepends=('git' 'nodejs' 'npm')
provides=(raindrop)

source_x86_64=('raindrop-amd64.deb::https://github.com/raindropio/desktop/releases/download/v5.7.6/Raindrop-amd64.deb')
sha256sums_x86_64=('79ffd91214a1889e9ad9d8b39b7e09b9a45d59ac87cf399cad19b058175b757d')

source_arm64=('raindrop-arm64.dev::https://github.com/raindropio/desktop/releases/download/v5.7.6/Raindrop-arm64.deb')
sha256sums_aarch64=('0ae5332738b2e4dd9b29788602cfa81a7bdb5f89f6427313e77b7fd020da5beb')

prepare() {
  echo "Extracting .deb"
  mkdir "${pkgname}-data"
  tar -xf data.tar.xz -C raindrop-data
}

package() {
  cd "${pkgname}-data"

  install -d "${pkgdir}/opt/${pkgname}"

  cp -r opt/Raindrop.io/. "${pkgdir}/opt/${pkgname}"
  install -Dm644 "usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _icons in 16 32 48 64 128 256 512; do
		install -Dm644 "usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
	done
}
