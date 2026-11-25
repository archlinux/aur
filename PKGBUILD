# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (the tag, the pkgver pacman can
# read and the checksums) and pushed to the AUR, or attached to a pre-release
# for the beta channel — edit this template, never the AUR copy.
# The AUR publishes this as lich-bin, and install.sh installs its own package
# as lich (/usr/local/bin). A pre-release keeps whichever name the installed
# one has, so pacman takes it as an upgrade instead of a conflict it would
# refuse under --noconfirm. The updater sets LICH_PKGNAME from the install.
pkgname="${LICH_PKGNAME:-lich-bin}"
pkgver=0.93.1
_tag=0.93.1
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
source=("lich-v${_tag}-linux-amd64.tar.zst::${url}/releases/download/v${_tag}/lich-v${_tag}-linux-amd64.tar.zst"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/lichdotdev/lich/v${_tag}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/lichdotdev/lich/v${_tag}/build/appicon.png")
sha256sums=('ab076a1ed06a8fba19c9525f2deca739a07330497350da3572d302831b5ec670'
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
