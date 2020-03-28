# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.35.0
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
source=("https://github.com/facebook/flipper/releases/download/v${pkgver}/Flipper-linux.zip"
		'flipper.desktop')
md5sums=('f4a6401ade9f6b4dfe207927e7b4a29d'
		 '3835f5d90a60f80dc644259c9aa713e5')

package() {
  cd "${srcdir}"
  rm Flipper-linux.zip
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  cp -r ${srcdir}/* ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper-project ${pkgdir}/usr/bin/flipper
  install -Dm644 flipper.desktop ${pkgdir}/usr/share/applications/flipper.desktop
  install -Dm644 ${srcdir}/resources/app/icon.png ${pkgdir}/usr/share/pixmaps/flipper.png
  rm "${pkgdir}/opt/flipper"/flipper.desktop
}