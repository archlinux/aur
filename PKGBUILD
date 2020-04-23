# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.37.0
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
source=("https://github.com/facebook/flipper/releases/download/v${pkgver}/Flipper-linux.zip")
sha512sums=('bb77a044cd4a3ea49e49c0e8f67b3aec6ae5edd7bdf5566463326609e5fb69131bc0cd3a2adfd6f83e299a25c02dc8869e48a61c37773571936f3b7094cb6cd2')
noextract=('Flipper-linux.zip')

package() {
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  unzip Flipper-linux.zip -d ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper ${pkgdir}/usr/bin/flipper
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 flipper.desktop ${pkgdir}/usr/share/applications/flipper.desktop
  install -Dm644 ${pkgdir}/opt/flipper/resources/app/icon.png ${pkgdir}/usr/share/pixmaps/flipper.png
}