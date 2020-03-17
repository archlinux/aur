# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipper-bin
pkgver=0.33.1
pkgrel=2
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
sha256sums=('96dc62b4c0d1816ff87f5a3d26dbf16d2167fdf9d7cba27dcc37413574f45272'
			'38a9977cebac01bdda62dda1d1705a5e71b73e34fe3be5dc193b762b2c86bf15')

package() {
  cd "${srcdir}"
  rm Flipper-linux.zip
  mkdir -p "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  cp -r ${srcdir}/* ${pkgdir}/opt/flipper
  ln -s /opt/flipper/flipper ${pkgdir}/usr/bin
  install -Dm644 flipper.desktop ${pkgdir}/usr/share/applications/flipper.desktop
  install -Dm644 ${srcdir}/resources/app/icon.png ${pkgdir}/usr/share/pixmaps/flipper.png
  rm "${pkgdir}/opt/flipper"/flipper.desktop
}