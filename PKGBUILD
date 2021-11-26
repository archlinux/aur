# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=1.3.3
pkgrel=1
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'hdf5' 'ffmpeg' 'python-opencv')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/1.3.3/videocut1.3.3.tar)
md5sums=(9ad676a6fcafb2a3adb039d823f739a1)

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


