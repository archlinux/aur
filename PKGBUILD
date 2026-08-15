# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases: https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-amd64/Packages

pkgname=chatgpt-desktop-bin
pkgver=26.810.52044
pkgrel=1
pkgdesc="ChatGPT desktop application for Linux (repackaged from the official binary)"
arch=('x86_64')
url="https://chatgpt.com/download"
license=('LicenseRef-custom')
options=('!strip' '!debug')
provides=(
  "chatgpt=${pkgver}"
)
conflicts=(
  'chatgpt'
)

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphite'
  'gtk3'
  'libcups'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libnotify'
  'libpulse'
  'libstdc++'
  'libusb'
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
  'sh'
  'xdg-utils'
)

optdepends=(
  'apparmor: automatically load the bundled profile for Chromium user namespaces'
  'git: enable Git repository integration'
  'gtk4: use the GTK 4 backend with --gtk-version=4'
  'kde-cli-tools: move deleted files to the Plasma trash through kioclient'
  'org.freedesktop.secrets: securely store credentials with a Secret Service backend'
  'pipewire: enable WebRTC screen sharing under Wayland'
)

backup=('etc/apparmor.d/chatgpt')
install="${pkgname}.install"

source_x86_64=(
  "chatgpt_${pkgver}_amd64.deb::https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_amd64.deb"
)
source=('chatgpt-launcher.sh')
noextract=("chatgpt_${pkgver}_amd64.deb")
sha256sums_x86_64=('708a15a1bb76e2bb7f0e376e5145391fa277ad3a64057c1d32537bdc2a1b4e6e')
sha256sums=('aab6b1105d7273443234e77412fbaa35ff9e04098ac63c2f73ae8e87afb43bd2')

package() {
  bsdtar -xOf "${srcdir}/chatgpt_${pkgver}_amd64.deb" data.tar.xz |
    bsdtar --no-same-owner -xJf - -C "${pkgdir}"

  install -Dm755 "${srcdir}/chatgpt-launcher.sh" \
    "${pkgdir}/usr/lib/chatgpt/codex-launcher"

  install -Dm644 "${pkgdir}/usr/share/doc/chatgpt/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s /usr/lib/chatgpt/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
}
