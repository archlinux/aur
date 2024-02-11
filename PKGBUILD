# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=downlords-faf-client
pkgver=2024.1.2
_pkgver="${pkgver//./_}"
_filename="faf_unix_${_pkgver}.tar.gz"
pkgrel=1
epoch=1
pkgdesc="Official client for Forged Alliance Forever"
url="https://www.faforever.com/"
arch=('any')
license=('MIT')
depends=('jdk21-openjdk' 'gtk3' 'lib32-libxcomposite')
source=("https://github.com/FAForever/downlords-faf-client/releases/download/v${pkgver}/$_filename"
        "https://github.com/FAForever/downlords-faf-client/raw/develop/src/media/appicon/128.png"
        'DownlordsFafClient.desktop'
        'downlords-faf-client')
sha256sums=('fcbf8baa9275778233c1a18fd2e5def0e99e172542c89950510cff6f15acb61f'
            '2a5803ca2dd463aa4b53d79cff7f30e3aa7beb0d874b39c8ef59e679fbde9d3d'
            '3fd2b21da9de9f9c02dd89ee07f49c559dbb2de15f4e86a9b31f6353f608ffa6'
            '9a49933425fde90de79a5627438718d68751ed206c6d15a192c084bdc93eb74b')

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
