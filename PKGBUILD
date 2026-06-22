# Maintainer: Timofey Brukhanchik <asyncbtd@gmail.com>

pkgname=vcs-lore-desktop-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="GUI client for next-generation open source version control system by Epic Games (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/EpicGames/lore"
license=('custom:Epic Games')
depends=(
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: systray indicator support'
)
provides=('lore-desktop')
options=('!strip' '!debug')
source=("https://releases.lore.org/desktop/releases/stable/lore-desktop_amd64.deb")
sha256sums=('dffe1f377e063df2ccb67cdd5080e1eb65b55cdfb1c0ed08c448a3d0144ab444')
noextract=("lore-desktop_amd64.deb")

package() {
  bsdtar -O -xf "${srcdir}/lore-desktop_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xzf -

  install -Dm644 "${pkgdir}/opt/Lore Desktop/resources/TERMS_OF_USE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/TERMS_OF_USE.txt"

  rm -rf "${pkgdir}/usr/share/doc"

  find "${pkgdir}" -type d -exec chmod 755 {} +
}
