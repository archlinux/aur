# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.81.0 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.81.0
pkgrel=1
pkgdesc="Run your coding agents side by side, each on its own branch"
arch=('x86_64')
url="https://github.com/lichdotdev/lich"
license=('AGPL-3.0-only')
provides=('lich')
conflicts=('lich')
# What the native window links against; the same list, per format, lives in
# build/linux/nfpm/nfpm.yaml.
depends=('glibc' 'libglvnd' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libx11'
         'libxcursor' 'libxfixes' 'fontconfig')
optdepends=('zenity: native folder picker')
source=("lich-v${pkgver}-linux-amd64.tar.zst::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64.tar.zst"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/lichdotdev/lich/v${pkgver}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/lichdotdev/lich/v${pkgver}/build/appicon.png")
sha256sums=('e6ecda6d88abc789ea6af7235f941bb9e046420683e26571c383ffd3002c8c85'
            'dd41fb10417c9038bc43cd1c503f196b05f5fbec07baa8695b50bdf8cfcdc47f'
            '75aa775e531ad495d905a37f07e8e608f4d93e4b2ff1d4b145a764e71ac48b0a')

package() {
  # makepkg unpacks the release tarball: lich and lich-native, which lich
  # looks for beside itself.
  install -Dm755 lich "${pkgdir}/usr/bin/lich"
  install -Dm755 lich-native "${pkgdir}/usr/bin/lich-native"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
