# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=downlords-faf-client
pkgver=2025.11.1
_pkgver="${pkgver//./_}"
_filename="faf_unix_${_pkgver}.tar.gz"
pkgrel=1
epoch=1
pkgdesc="Official client for Forged Alliance Forever"
url="https://www.faforever.com/"
arch=('any')
license=('MIT')
depends=('jdk25-openjdk' 'gtk3' 'lib32-libxcomposite')
source=("https://github.com/FAForever/downlords-faf-client/releases/download/v${pkgver}/$_filename"
        "https://github.com/FAForever/downlords-faf-client/raw/develop/src/media/appicon/128.png"
        'DownlordsFafClient.desktop'
        'downlords-faf-client')
sha256sums=('703cec57d2d3bd9bcb25d6df7779240ccd6473c867baaee1326fbf4491364740'
            '2a5803ca2dd463aa4b53d79cff7f30e3aa7beb0d874b39c8ef59e679fbde9d3d'
            '3fd2b21da9de9f9c02dd89ee07f49c559dbb2de15f4e86a9b31f6353f608ffa6'
            'aea47646ad51ffc45747faf1a2da51cf96d10aab61e3d7ca71013d934149e4f0')

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
