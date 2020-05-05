# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.40.0
pkgrel=1
pkgdesc='A desktop debugging platform for mobile developers'
arch=('any')
url='https://fbflipper.com/'
license=('MIT')
provides=('flipper')
depends=('gtk3'
    		 'libsecret'
    		 'libxss'
    		 'nss')
optdepends=('watchman: An inotify-based file watching and job triggering command line utility'
			      'android-sdk: Android debugging support')
makedepends=('gendesk' 'unzip')
source=("${pkgname}-${pkgver}.zip::https://github.com/facebook/flipper/releases/download/v${pkgver}/Flipper-linux.zip")
sha256sums=('8cb607b3d024a96477deba136a3a0e1d48d19613fc8d7ae793e0e9e42b26b7fe')
noextract=("${pkgname}-${pkgver}.zip")

package() {
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  unzip ${pkgname}-${pkgver}.zip -d ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper ${pkgdir}/usr/bin/flipper
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 flipper.desktop ${pkgdir}/usr/share/applications/flipper.desktop
  install -Dm644 ${pkgdir}/opt/flipper/resources/app/icon.png ${pkgdir}/usr/share/pixmaps/flipper.png
}