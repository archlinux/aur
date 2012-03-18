# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=dsassistant
pkgver=1920
pkgrel=2
pkgdesc="Disk Station Assistant - An app to setup Synology DiskStations"
arch=('i686' 'x86_64')
url="http://www.synology.com/releaseNote_enu/Assistant.php"
license=('unknown')
depends=()
if test "$CARCH" == x86_64; then
	depends=("${depends[@]}" lib32-glibc lib32-glib2 lib32-libxt  lib32-libxext lib32-fontconfig lib32-libxrender)
fi
makedepends=(unzip)
source=(http://download.synology.com/download/ds/DSAssistant/${pkgname}_Linux_${pkgver}.zip
        SynologyAssistant.desktop
        dsassistant.png)
md5sums=('99905396e2ee844f4a90e7c38a9199c6'
         '73e2c353c541bc79db01d40117d92133'
         '6b447bfb0e43256e2bf1d388a1b022d3')

build() {
  cd $srcdir

  mkdir -p ${pkgdir}/opt/dsassistant
  unzip -o dsassistant_Linux_${pkgver}.zip -d ${srcdir}
  tar zxvf ${srcdir}/linux/SynologyAssistant-3.2-${pkgver}.tar.gz -C ${pkgdir}/opt/dsassistant

  mkdir -p ${pkgdir}/usr/bin
  ln -sf /opt/dsassistant/SynologyAssistant/SynologyAssistant ${pkgdir}/usr/bin/SynologyAssistant
  ln -sf /opt/dsassistant/SynologyAssistant/SynologyAssistant ${pkgdir}/usr/bin/dsassistant

  mkdir -p ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/SynologyAssistant.desktop ${pkgdir}/usr/share/applications/SynologyAssistant.desktop
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  install -m644 ${srcdir}/dsassistant.png ${pkgdir}/usr/share/pixmaps/dsassistant.png

  msg2 "Run it by 'SynologyAssistant' or 'dsassistant' when installed"
}
