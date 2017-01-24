pkgname=dvblink-viewer
pkgver=6.0.0
pkgrel=1
pkgdesc="DVBLink Viewer is the TV viewer app for the DVBLink server for streaming TV."
arch=('x86_64')
license=('custom:"Copyright (c) 2006-2017 DVBLogic"')
url="http://www.dvblogic.com"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('58a25a4698094e4846bf65b35e9aafa1d867e277733dac456f5004d6dfb345b5')

source_x86_64=("http://www.dvblogic.com/download/installations/pc-linux-ubuntu-x86_64/dvblink-viewer-pc-linux-ubuntu-x86_64-${pkgver}.deb")
depends=("tar>=1.22")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

  # Unpack player
  tar -xzvf "${pkgdir}"/usr/local/bin/dvblink_viewer/dvblink_player.tar.gz -C "${pkgdir}/usr/local/bin/dvblink_viewer/"

  # Clean
  rm "${pkgdir}"/usr/local/bin/dvblink_viewer/dvblink_player.tar.gz

  # Install it
  install -D "${pkgdir}"/usr/local/bin/dvblink_viewer/dvblink_viewer.desktop "${pkgdir}"/usr/share/applications/dvblink_viewer.desktop

	chmod -R go-w "${pkgdir}"/usr
}
