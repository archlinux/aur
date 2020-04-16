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
md5sums=('8937302f2bad0fb19f8c9a0327b54234')
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