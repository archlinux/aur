# Maintainer: M0N7Y5
# Contributor: Albert Latham <me@albertlatham.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname="plasticity-bin"
pkgver=26.2.0
pkgrel=1
pkgdesc="3D modeling software for concept artists"
arch=("x86_64")
license=("LicenseRef-Plasticity-EULA")
url='https://github.com/nkallen/plasticity'
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  coreutils
  dbus
  desktop-file-utils
  expat
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  gvfs
  hicolor-icon-theme
  libcups
  libdrm
  libgcc
  libnotify
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  openssl
  pango
  procps-ng
  trash-cli
  xdg-utils
)
optdepends=(
  'kde-cli-tools: KDE integration for external file and URL handlers'
  'libpulse: PulseAudio-compatible audio support, including PipeWire'
)
source=(
  "https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb"
  "https://raw.githubusercontent.com/nkallen/plasticity/refs/tags/v${pkgver}/LICENSE"
  plasticity-launcher
  plasticity.desktop
  plasticity-x11.desktop
  plasticity-reset-shader-cache.desktop
)
sha512sums=('c7cc5185d0c5e3309b26c8ccc511fff300eec943d401245006f6647b3a25009e7f1b17c312046ff2eca0adcc44fbbe886f08e064a6a3172fc96d8ef1978ef5f6'
            '1fbd6b24b4022331307ee3b8266fc6eee956238b5854633071848c145a044127f6d6eadc8c07c288c4dcd16c0de10e933ff21c5d8c715c273902cdeffded4bcd'
            'ca988f29f74883d4630c07ec3dcdc194a85a2b12c533cff9229080829d5d3a8eba8bc20cd2bd313a39dec8c008bb0398a7ae6d91a2af3ab37be8a833cd32c41a'
            '2862bdf95cd4206808495c2b0846223b08923c392a35bc17b415e22f5ba90131fbc48c114e538fd9ae48ba847dec935a9f625d1ea33d7aa94bd29711dccb0ef9'
            '6dd248c2b461b76ed0871c9cc44b5c40127ff2710096165976ba1a9022b453a33bc3443d5c2a4968d01c2b35c218723db2d8ee2042c3b93d9a4a1f19c87d82a0'
            '73c2e4ac245cb112ee37648e71488e3f67deef87584150abb7f7ac3610be3d8a9ed097989b19bc49409e6db93bfff8d418de8dec7c2520eef3c1bf5688894de0')
options=(!strip !debug)

package() {
  bsdtar -xf data.tar.* --no-same-owner -C "$pkgdir"
  chmod 4755 "$pkgdir/usr/lib/plasticity/chrome-sandbox"
  rm -f -- "$pkgdir/usr/bin/plasticity"
  install -Dm755 plasticity-launcher "$pkgdir/usr/bin/plasticity"
  install -Dm644 plasticity.desktop plasticity-x11.desktop plasticity-reset-shader-cache.desktop \
    -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.source"
  install -Dm644 "$pkgdir/usr/share/doc/plasticity/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  printf '%s\n' 'https://www.plasticity.xyz/eula' > "$pkgdir/usr/share/licenses/$pkgname/EULA.url"
  rm -f -- "$pkgdir/usr/share/lintian/overrides/plasticity"
}
# vim:set ts=2 sw=2 et:
