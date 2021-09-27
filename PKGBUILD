# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('x86_64')
license=('BSD3')
url="https://github.com/edrlab/thorium-reader"
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
_filename=EDRLab.ThoriumReader_${pkgver}_amd64.deb
source=(
  "${pkgname}.tar.gz::${url}/releases/download/v${pkgver}/${_filename}"
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=('a8ea5ed14886dc888fd14dfa94770312343b9ed984d005065fd46269ceb23cfec629084dd9b7f9d6644887801ee334576580a0f2fdf02deda66aba9baa399c0a'
            'acb9c8cdd1225dd5e7874b5380cc597adf9cf32dfcebccfd18d13f36f525b56d9319734da28de5ec44a983197f91f2e80231211197b7201e4efe115972aae96a')

package() {
  tar xJf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Symlink
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Thorium/thorium" "${pkgdir}/usr/bin/thorium"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Fix "no icon" issue (see also https://github.com/edrlab/thorium-reader/issues/1241)
  mv ${pkgdir}/usr/share/icons/hicolor/0x0 ${pkgdir}/usr/share/icons/hicolor/1024x1024
  install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/thorium.png" "${pkgdir}/usr/share/pixmaps/thorium.png"
}
