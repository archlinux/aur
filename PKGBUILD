# Maintainer: SLava <slavkaplay6@gmail.com>

pkgname=happwner-pc-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Desktop proxy subscription bridge (prebuilt binary)'
arch=('x86_64')
url='https://github.com/Kasumicic/Happwner_PC'
license=('LicenseRef-Happwner-NonCommercial')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'libx11'
  'zlib'
)
makedepends=('jdk21-openjdk')
optdepends=(
  'gnome-shell-extension-appindicator: tray integration on GNOME'
  'xdg-desktop-portal: native file dialogs'
)
provides=("happwner-pc=${pkgver}")
conflicts=('happwner-pc')
options=('!debug' '!strip')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/happwner-pc-${pkgver}-linux-x86_64.tar.gz"
  "happwner-pc-${pkgver}::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/happwner-pc"
  "happwner-pc-${pkgver}.desktop::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/happwner-pc.desktop"
  "happwner-pc-${pkgver}-48.png::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/icons/happwner-pc-48.png"
  "happwner-pc-${pkgver}-64.png::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/icons/happwner-pc-64.png"
  "happwner-pc-${pkgver}-128.png::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/icons/happwner-pc-128.png"
  "happwner-pc-${pkgver}-256.png::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/icons/happwner-pc-256.png"
  "happwner-pc-${pkgver}-512.png::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/icons/happwner-pc-512.png"
  "TERMS-${pkgver}::https://raw.githubusercontent.com/Kasumicic/Happwner_PC/v${pkgver}/packaging/arch/TERMS"
)
sha256sums=(
  '339a48c30a2a941db7244485253ba4a97587d6025775df52feaee15589be6dc3'
  '2287e3551699e71ebaf7e80db3351535df468421ac8e51ee64fc29add41da847'
  '7995a9916ffdbe01dfa46803775fa6adabacbb801b4e63939cad0b2a5ee39e7a'
  '12528721d34e00f9eee2c5c9242cb477b713c72540ddfb018eadae2a5ba84a15'
  '2b3b15c5cdf5526ceba94b6c851ba6292d85bceaa9f4ecdaf5894249c6088ca7'
  '824021fbd88e17f588983796fb4b80f10ea8cb9d122064da86ed4b083aaee7b5'
  '4d5625fe9aa00eee14b76fb85fea69685f522acb0b471f7ac824b7fcca9215e6'
  '83dd90d0dd2882735f8f1259a60dea7dfebff605672759c1de4f1c5c69955a0a'
  '5e9e97c2536f5a102ddf0fe2274e0e3c15e05ce2023f68d01c2352dd4a1e8b34'
)

package() {
  install -d "$pkgdir/opt/happwner-pc"
  cp -a "$srcdir/Happwner PC/." "$pkgdir/opt/happwner-pc/"

  # The jpackage image has a runtime but no java command. The wrapper avoids a
  # known native-launcher teardown crash, so add the matching Arch JDK command.
  install -Dm755 /usr/lib/jvm/java-21-openjdk/bin/java \
    "$pkgdir/opt/happwner-pc/lib/runtime/bin/java"

  install -Dm755 "$srcdir/happwner-pc-${pkgver}" \
    "$pkgdir/usr/bin/happwner-pc"
  install -Dm644 "$srcdir/happwner-pc-${pkgver}.desktop" \
    "$pkgdir/usr/share/applications/happwner-pc.desktop"

  local size
  for size in 48 64 128 256 512; do
    install -Dm644 "$srcdir/happwner-pc-${pkgver}-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/happwner-pc.png"
  done
  install -Dm644 "$srcdir/happwner-pc-${pkgver}-256.png" \
    "$pkgdir/usr/share/pixmaps/happwner-pc.png"
  install -Dm644 "$srcdir/TERMS-${pkgver}" \
    "$pkgdir/usr/share/licenses/$pkgname/TERMS"
}
