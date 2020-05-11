# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.41.0
pkgrel=1
pkgdesc='A desktop debugging platform for mobile developers'
arch=('x86_64')
url='https://fbflipper.com'
license=('MIT')
provides=('flipper')
depends=('gtk3'
         'libsecret'
         'libxss'
         'nss'
         'alsa-lib'
         'nodejs'
         'libcups')
optdepends=('watchman: An inotify-based file watching and job triggering command line utility'
			      'android-sdk: Android debugging support')
makedepends=('gendesk' 'unzip')
noextract=("${pkgname}-${pkgver}.zip")
source=("${pkgname}-${pkgver}.zip::https://github.com/facebook/flipper/releases/download/v${pkgver}/Flipper-linux.zip"
        'LICENSE::https://raw.githubusercontent.com/facebook/flipper/master/LICENSE')
sha256sums=('7af0c384b3b891a0824bac062ec2ec5358d87ea8e59be442a9b5a31f25aa44cd'
            '52412d7bc7ce4157ea628bbaacb8829e0a9cb3c58f57f99176126bc8cf2bfc85')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  unzip ${pkgname}-${pkgver}.zip -d ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper "${pkgdir}/usr/bin/flipper"
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 flipper.desktop "${pkgdir}/usr/share/applications/flipper.desktop"
  install -Dm644 "${pkgdir}/opt/flipper/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/flipper.png"
}