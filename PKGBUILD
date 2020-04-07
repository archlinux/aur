# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.36.0
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
makedepends=('gendesk')
source=("https://github.com/facebook/flipper/releases/download/v${pkgver}/Flipper-linux.zip")
md5sums=('c376c68b9af140e2c64cb7053c4465f3')

package() {
  cd "${srcdir}"
  rm Flipper-linux.zip
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  cp -r ${srcdir}/* ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper-project ${pkgdir}/usr/bin/flipper
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 flipper.desktop ${pkgdir}/usr/share/applications/flipper.desktop
  install -Dm644 ${srcdir}/resources/app/icon.png ${pkgdir}/usr/share/pixmaps/flipper.png
  rm "${pkgdir}/opt/flipper"/flipper.desktop
}