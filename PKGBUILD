# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=dsassistant
pkgver=4206
_synver=4.3
pkgrel=1
pkgdesc="Disk Station Assistant - An app to setup Synology DiskStations"
arch=('i686' 'x86_64')
url="http://www.synology.com/releaseNote_enu/Desktop_Assistant.php"
license=('unknown')
depends=()
if test "$CARCH" == x86_64; then
	depends=("${depends[@]}" lib32-glibc lib32-glib2 lib32-libxt  lib32-libxext lib32-fontconfig lib32-libxrender)
fi
source=(http://download.synology.com/download/ds/DSAssistant/${pkgver}/linux/SynologyAssistant-${_synver}-${pkgver}.tar.gz
        SynologyAssistant.desktop
        dsassistant.png)
md5sums=('41a133d43bfcca35470b905c51ed19c2'
         '73e2c353c541bc79db01d40117d92133'
         '6b447bfb0e43256e2bf1d388a1b022d3')

package() {
  cd $srcdir

  mkdir -p ${pkgdir}/opt/dsassistant
	cp -r ${srcdir}/SynologyAssistant/* ${pkgdir}/opt/dsassistant

	# Fix path for readlink
	sed -i "s%/bin/readlink%/usr/bin/readlink%g" ${pkgdir}/opt/dsassistant/SynologyAssistant

	mkdir -p ${pkgdir}/usr/bin
  ln -sf /opt/dsassistant/SynologyAssistant ${pkgdir}/usr/bin/SynologyAssistant
  ln -sf /opt/dsassistant/SynologyAssistant ${pkgdir}/usr/bin/dsassistant

  install -Dm644 ${srcdir}/SynologyAssistant.desktop ${pkgdir}/usr/share/applications/SynologyAssistant.desktop
  install -Dm644 ${srcdir}/dsassistant.png ${pkgdir}/usr/share/pixmaps/dsassistant.png

  msg2 "Run it by 'SynologyAssistant' or 'dsassistant' when installed"
}
