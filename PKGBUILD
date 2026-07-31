# Maintainer: Ben Towali <ben@bentowali.com>

pkgname=raindrop
pkgver='5.7.9'
pkgrel=1
pkgdesc="All-in-one bookmark manager"
arch=('x86_64' 'aarch64')
url="https://raindrop.io"
license=('MIT')
depends=()
makedepends=()
provides=(raindrop)

source_x86_64=('raindrop-amd64.deb::https://github.com/raindropio/desktop/releases/download/v5.7.9/Raindrop-amd64.deb' 'raindrop.desktop')
sha256sums_x86_64=('66520ba8b3a25b92495550a61c0511267c2305c6d2fb07718f2371a6a4753e4e' 'SKIP')

source_arm64=('raindrop-arm64.dev::https://github.com/raindropio/desktop/releases/download/v5.7.9/Raindrop-arm64.deb' 'raindrop.desktop')
sha256sums_aarch64=('b3c0cef4a8be5aea2a870b208e70246d5579ecdd571dcc4cc2bec579f22620eb' 'SKIP')

prepare() {
  echo "Extracting .deb"
  mkdir "${pkgname}-data"
  tar -xf data.tar.xz -C raindrop-data
}

package() {
  cd "${pkgname}-data"

  install -d "${pkgdir}/opt/${pkgname}"

  cp -r opt/Raindrop.io/. "${pkgdir}/opt/${pkgname}"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _icons in 16 32 48 64 128 256 512; do
		install -Dm644 "usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
  done
}
