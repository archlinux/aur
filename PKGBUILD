# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=1.3.2
pkgrel=4
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'hdf5' 'ffmpeg' 'python-opencv')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/1.3.2/videocut1.3.2.tar)
md5sums=(e004c59b2e170bd41da2b2da9ed75049)

build() {
make -C ${pkgname}/ffmpeg/src/
make -C ${pkgname}/ffmpeg/src/ clean
}

package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm  $srcdir/$pkgname/install.sh
  rm  $srcdir/$pkgname/uninstall.sh
  rm -rf  $srcdir/$pkgname/ffmpeg/bin/V3/
  cp  $srcdir/$pkgname/VideoCut.desktop "${pkgdir}/usr/share/applications"
  cp -r $srcdir/$pkgname/* "${pkgdir}/opt/${pkgname}"
  ln -s /opt/videocut/VideoCut.py  ${pkgdir}//usr/bin/VideoCut
}


