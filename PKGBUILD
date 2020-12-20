# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.69.0
pkgrel=1
pkgdesc='A desktop debugging platform for mobile developers'
arch=('x86_64')
url='https://fbflipper.com'
license=('MIT')
provides=('flipper')
depends=('gtk3'
         'libsecret'
         'nss'
         'nodejs')
optdepends=('watchman: An inotify-based file watching and job triggering command line utility'
            'android-sdk: Android debugging support')
makedepends=('gendesk' 'unzip')
noextract=("${pkgname}-${pkgver}.zip")
source=("${pkgname}-${pkgver}.zip::https://github.com/facebook/flipper/releases/download/v${pkgver}/Flipper-linux.zip"
        'LICENSE::https://raw.githubusercontent.com/facebook/flipper/master/LICENSE'
        'icon.png::https://camo.githubusercontent.com/673adcb9028e5675877b9682e437869e36b5687a/68747470733a2f2f6662666c69707065722e636f6d2f696d672f69636f6e2e706e67')
sha256sums=('ebd61d8c99484d37e51dc4d2e06e2d0532751785ab084de3ed94602fe9ff32b2'
            '52412d7bc7ce4157ea628bbaacb8829e0a9cb3c58f57f99176126bc8cf2bfc85'
            '336377e7d4fd4340f3c6ad8b7c6e4dcfe36c27b667bf82c2aa18526a6ced3834')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  unzip ${pkgname}-${pkgver}.zip -d ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper "${pkgdir}/usr/bin/flipper"
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 flipper.desktop "${pkgdir}/usr/share/applications/flipper.desktop"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/flipper.png"
}
