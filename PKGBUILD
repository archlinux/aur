# Maintainer: Eli Fereira <eli@fereira.net>

pkgname=colibri-social-beta-bin
pkgver=0.6.0_spaces.25
pkgrel=1
pkgdesc="Call, chat, and hang out on a platform built for you! (spaces version)"
url="https://github.com/colibri-social/colibri.social"
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v${pkgver//_/-}"
arch=('x86_64')
license=('MIT')
conflicts=(
  'colibri-social'
  'colibri-social-beta'
)
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'cairo'
  'glib2'
  'gdk-pixbuf2'
  'hicolor-icon-theme'
  'nspr'
  'nss'
  'alsa-lib'
)
makedepends=(
  'nodejs'
  'pnpm'
  'rust'
  'cargo'
)
source=(
  "${pkgname}-${pkgver//_/-}.tar.gz::${url}/releases/download/v${pkgver//_/-}/Colibri.Social_${pkgver//_/-}_amd64.deb"
  "LICENSE_$pkgver::$_rawurl/LICENSE"
)
sha256sums=(
  '3df7489512e51bdc0e3c42750595ae8a12dde39005f3d3def7a9beae9acabb58'
  'SKIP'
)

prepare() {
  tar -xf data.tar.*
}

package() {
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  cp -a "${srcdir}/usr" "${pkgdir}/"

  # Disable autoupdates
  sed -i 's/Exec=colibri-social/Exec=colibri-social --no-update-check/' "${pkgdir}/usr/share/applications/Colibri Social.desktop"
}
