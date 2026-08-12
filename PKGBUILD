# Maintainer: Akira <akira.uestc at gmail dot com>
# Releases: https://persistent.oaistatic.com/codex-app-prod/linux/deb/dists/stable/main/binary-amd64/Packages

pkgname=chatgpt-desktop-bin
pkgver=26.803.81509
pkgrel=1
pkgdesc="Official ChatGPT desktop app for Linux"
arch=('x86_64')
url="https://chatgpt.com/download"
license=('custom')
options=('!strip' '!debug')
provides=(
  "chatgpt=${pkgver}"
  "openai-codex-desktop=${pkgver}"
)
conflicts=(
  'chatgpt'
  'openai-codex-desktop'
)
replaces=('openai-codex-desktop')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphite'
  'gtk3'
  'libcups'
  'libdrm'
  'libglvnd'
  'libnotify'
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
  'openssl'
  'pango'
  'systemd-libs'
  'sh'
  'xdg-utils'
)

optdepends=(
  'apparmor: support the bundled user-namespace profile'
  'git: Git repository integration'
  'gnome-keyring: Secret Service backend for credential storage'
  'kde-cli-tools: file deletion support under KDE Plasma'
  'libsecret: Secret Service credential storage support'
  'pipewire: screen sharing under Wayland'
)

backup=('etc/apparmor.d/chatgpt')

source_x86_64=(
  "chatgpt_${pkgver}_amd64.deb::https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_amd64.deb"
)
source=('chatgpt-launcher.sh')
noextract=("chatgpt_${pkgver}_amd64.deb")
sha256sums_x86_64=('a9bf91a368f9f7c4eea38082a9fb8fb46b8d005b719a6d7715d2e5a1982c38eb')
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
