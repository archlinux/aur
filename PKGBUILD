# Maintained automatically from GitHub release tags. Do not edit in the AUR clone.
pkgname=knead-net-gui
pkgver=0.1.0
pkgrel=1
pkgdesc='Desktop GUI for automatic breadboard layout from KiCad schematics'
arch=('x86_64')
url='https://github.com/dfdc1123/knead-net-gui'
license=('GPL-3.0-only')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'pnpm' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# GitHub Actions replaces this with the release tag's verified checksum before
# pushing the file to AUR.
sha256sums=('3a5a0c5136ddbc58f87ab13e62d1334e4c07e644bea63b04162aae10ac2924a5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pnpm install --frozen-lockfile
  pnpm tauri build --no-bundle
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "${startdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
