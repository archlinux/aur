# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Naglis Jonaitis <naglis@mailbox.org>

pkgname=thorium-reader-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('x86_64')
license=(' BSD-3-Clause')
url="https://github.com/edrlab/thorium-reader"
depends=('libnotify' 'nss' 'libxss' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
_filename=EDRLab.ThoriumReader_${pkgver}_amd64.deb
options=('!strip')
source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_filename}"
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=('2890ec00f5834717ad8e43b9d183a0653ab018a2d6a3fa19c6337a6bcd1b0798110d09d7135780047afe0a34fa1e9c5b378be23a6422dab70d2754c46da6c4c5'
            'acb9c8cdd1225dd5e7874b5380cc597adf9cf32dfcebccfd18d13f36f525b56d9319734da28de5ec44a983197f91f2e80231211197b7201e4efe115972aae96a')

package() {
  cd "${srcdir}"
  tar xJf data.tar.xz -C "${pkgdir}"

  # Symlink
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Thorium/thorium" "${pkgdir}/usr/bin/thorium"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/thorium.png" "${pkgdir}/usr/share/pixmaps/thorium.png"
}
