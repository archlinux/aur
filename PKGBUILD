# Maintainer: Sable Maintainers <https://git.sable.moe/SableClient/sable-next>

pkgname=sable-bin
pkgver=26.11.2
pkgrel=1
pkgdesc="A Matrix client"
arch=('x86_64')
url="https://git.sable.moe/SableClient/sable-next"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'nss'
  'libnotify'
  'libxss'
  'libxtst'
  'at-spi2-core'
  'util-linux-libs'
  'xdg-utils'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
provides=("sable=${pkgver}")
conflicts=('sable')
options=('!strip' '!debug')
noextract=("${pkgname}-${pkgver}-amd64.deb")
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/sable-${pkgver}-amd64.deb")
sha256sums_x86_64=('416cc3ef128a4ef620a91939565af2cb45a577dadd7e05f7d38963548d97746b')

package() {
  bsdtar -O -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" 'data.tar*' \
    | bsdtar -xp -C "${pkgdir}"
  find "${pkgdir}" -type d -exec chmod 755 {} +
  chmod 4755 "${pkgdir}/opt/Sable/chrome-sandbox"
  # Updates are managed by pacman, not electron-updater's Debian installer.
  rm -f "${pkgdir}/opt/Sable/resources/app-update.yml"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/Sable/sable' "${pkgdir}/usr/bin/sable"
}
