# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=downlords-faf-client
pkgver=2023.6.1
_pkgver="${pkgver//./_}"
_filename="faf_unix_${_pkgver}.tar.gz"
pkgrel=1
epoch=1
pkgdesc="Official client for Forged Alliance Forever"
url="https://www.faforever.com/"
arch=('any')
license=('MIT')
depends=('jdk17-openjdk' 'gtk3')
source=("https://github.com/FAForever/downlords-faf-client/releases/download/v${pkgver}/$_filename"
        "https://github.com/FAForever/downlords-faf-client/raw/develop/src/media/appicon/128.png"
        'DownlordsFafClient.desktop'
        'downlords-faf-client')
sha256sums=('17be89861fb73b9770110800eef198e6a9da28c4e1a10044d74dfa3fbcfe66a5'
            '2a5803ca2dd463aa4b53d79cff7f30e3aa7beb0d874b39c8ef59e679fbde9d3d'
            '3fd2b21da9de9f9c02dd89ee07f49c559dbb2de15f4e86a9b31f6353f608ffa6'
            '37ed192b01966f73e7b295eb82725aebd03e494ed71badc39016badb824ed298')

package() {
  mkdir -p "${pkgdir}/usr/share/java"
  tar xfv "${_filename}" -C "${pkgdir}/usr/share/java"

  _subdir="faf-client-${pkgver}"
  mv ${pkgdir}/usr/share/java/$_subdir ${pkgdir}/usr/share/java/downlords-faf-client
  install -D "${srcdir}/DownlordsFafClient.desktop" "${pkgdir}/usr/share/applications/DownlordsFafClient.desktop"
  install -D "${srcdir}/downlords-faf-client" "${pkgdir}/usr/bin/downlords-faf-client"
  install -D "${srcdir}/128.png" "${pkgdir}/usr/share/java/downlords-faf-client/icon.png"
  chmod +x "${pkgdir}/usr/share/java/downlords-faf-client/natives/faf-uid"
}
