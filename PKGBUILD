# Maintainer: PanNNN <cool.panjianhao@gmail.com>
pkgname=frame0
pkgver=1.7.0
pkgrel=1
pkgdesc="A sleek Balsamiq-alternative wireframing tool for modern apps"
arch=('x86_64')
url="https://frame0.app"
license=('LicenseRef-Frame0-EULA' 'MIT')
options=('!strip' '!debug')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'fontconfig'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libgcc'
  'libnotify'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)
optdepends=(
  'libpulse: PulseAudio/PipeWire audio output'
  'libsecret: store credentials in the system keyring'
)
source=("https://files.frame0.app/releases/linux/x64/frame0_${pkgver}_amd64.deb")
sha256sums=('637e311783d906f05363087f2805ba6b93d443f66f3175b02582dee5b3085c89')

package() {
  # makepkg already extracts the .deb; data.tar may be .xz or .zst depending on upstream
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  # Debian-only metadata
  rm -rf "${pkgdir}/usr/share/lintian"

  # Licenses (Frame0 itself is under its EULA: https://frame0.app/legals/license)
  install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron"
  install -Dm644 "${pkgdir}/usr/lib/${pkgname}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
