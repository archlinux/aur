# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=2.1.5
pkgrel=1
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL2')
depends=('python-pyqt5' 'mpv' 'ffmpeg' 'python-pillow')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/2.1.5/videocut2.1.5.tar)
md5sums=(8d2604cf5eec566c6f4e23d9d3d51370)

build() {
make -C ${pkgname}/ffmpeg/src/ -f makefile
make -C ${pkgname}/ffmpeg/src/ -f makefile clean
}

package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm  $srcdir/$pkgname/install.sh
  rm  $srcdir/$pkgname/uninstall.sh
  rm -rf  $srcdir/$pkgname/ffmpeg/bin/V3/
  rm -rf  $srcdir/$pkgname/ffmpeg/bin/V4/
  cp  $srcdir/$pkgname/VideoCut.desktop "${pkgdir}/usr/share/applications"
  cp -r $srcdir/$pkgname/* "${pkgdir}/opt/${pkgname}"
  ln -s /opt/videocut/VideoCut.py  ${pkgdir}/usr/bin/videocut
}


