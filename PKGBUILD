# Maintainer: Ben Towali <ben@bentowali.com>

pkgname=raindrop
pkgver='5.7.7'
pkgrel=1
pkgdesc="All-in-one bookmark manager"
arch=('x86_64' 'aarch64')
url="https://raindrop.io"
license=('MIT')
depends=()
makedepends=('git' 'nodejs' 'npm')
provides=(raindrop)

source_x86_64=('raindrop-amd64.deb::https://github.com/raindropio/desktop/releases/download/v5.7.7/Raindrop-amd64.deb' 'raindrop.desktop')
sha256sums_x86_64=('b2132c68667eefb689ed0720bee12785ff59973cf1d6a1d2052eb2a729663e11' 'SKIP')

source_arm64=('raindrop-arm64.dev::https://github.com/raindropio/desktop/releases/download/v5.7.7/Raindrop-arm64.deb' 'raindrop.desktop')
sha256sums_aarch64=('5e4eb72c1c405b49abb50fd6d60864ccfa036f34b69acc16e0040e3ad89da390' 'SKIP')

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
