# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: RogueGirl <3a33oxx40 at mozmail dot com>
# Contributor: Laurent OF Fough

pkgname=iptvnator-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Cross-platform IPTV player application with support for M3U/M3U8 playlists, EPG, favorites, TV archive and more."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')

depends=(
  'c-ares'
  'ffmpeg'
  'gtk3'
  'http-parser'
  'libevent'
  'libvpx'
  'libxslt'
  'libxss'
  'minizip'
  'nss'
  're2'
  'snappy'
  'libnotify'
  'libappindicator-gtk3'
)

provides=('iptvnator')
conflicts=('iptvnator')
options=(!strip)

source=("iptvnator-${pkgver}.pacman::https://github.com/4gray/iptvnator/releases/download/v${pkgver}/iptvnator-${pkgver}-linux-x64.pacman")
sha256sums=('0e8eeac752d47614579ceb431300bebb02fdfdf73cd6a83761df5fadd283f99a')

package() {
  bsdtar -xf "${srcdir}/iptvnator-${pkgver}.pacman" -C "${pkgdir}"

  # Provide a stable CLI entry point regardless of upstream install-script behavior
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/IPTVnator/iptvnator" "${pkgdir}/usr/bin/iptvnator"

  # License
  install -Dm644 "${pkgdir}/opt/IPTVnator/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove upstream pacman metadata files from the repack
  rm -f "${pkgdir}/.INSTALL" \
        "${pkgdir}/.MTREE" \
        "${pkgdir}/.PKGINFO"
}

# vim:set ts=2 sw=2 et:
