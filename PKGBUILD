# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: RogueGirl <3a33oxx40 at mozmail dot com>
# Contributor: Laurent OF Fough

pkgname=iptvnator-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Video player for IPTV playlists (m3u, m3u8) with EPG, favorites, and TV archive support."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libglvnd'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'mpv'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
)

optdepends=(
  'libappindicator-gtk3: tray icon support'
  'ffmpeg: for extended codec support'
)

provides=('iptvnator')
conflicts=('iptvnator')
options=('!strip' '!debug')

source=("iptvnator-${pkgver}.pacman::${url}/releases/download/v${pkgver}/iptvnator-${pkgver}-linux-x64.pacman")
sha256sums=('44e294f2b6c8540787b22368142046c5455348ba5858bb0d83ec656e55b0d5c5')

package() {
  bsdtar -xf "iptvnator-${pkgver}.pacman" -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/IPTVnator/iptvnator" "${pkgdir}/usr/bin/iptvnator"

  install -Dm644 "${pkgdir}/opt/IPTVnator/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -f "${pkgdir}/.INSTALL" \
        "${pkgdir}/.MTREE" \
        "${pkgdir}/.PKGINFO"
}

# vim:set ts=2 sw=2 et:
