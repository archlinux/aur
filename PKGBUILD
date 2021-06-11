# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=1.3.2
pkgrel=2
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'hdf5' 'ffmpeg' 'python-opencv')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/1.3.2.1/videocut1.3.2.tar)
md5sums=(003987f4c188dd606b28dd09c798a200)

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
  ln -s ${pkgdir}/opt/videocut/VideoCut.py  ${pkgdir}//usr/bin/VideoCut
}


