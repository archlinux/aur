# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=dsassistant
pkgver=4448
_synver=5.0
pkgrel=1
pkgdesc="Disk Station Assistant - An app to setup Synology DiskStations"
arch=('i686' 'x86_64')
url="http://www.synology.com/en-global/releaseNote/tool/Synology%20Assistant"
license=('unknown')
depends=()
if test "$CARCH" == x86_64; then
	depends=("${depends[@]}" lib32-glibc lib32-glib2 lib32-libxt  lib32-libxext lib32-fontconfig lib32-libxrender)
fi
source=(http://global.download.synology.com/download/Tools/SynologyAssistant/${pkgver}/Linux/SynologyAssistant-${_synver}-${pkgver}.zip
        SynologyAssistant.desktop
        dsassistant.png)
md5sums=('828f29e4c7d387ad954467ec0ea67b13'
         '73e2c353c541bc79db01d40117d92133'
         '6b447bfb0e43256e2bf1d388a1b022d3')

package() {
  cd $srcdir

  mkdir -p ${pkgdir}/opt/dsassistant
	tar -xzf ${srcdir}/SynologyAssistant-${_synver}-${pkgver}.tar.gz
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
