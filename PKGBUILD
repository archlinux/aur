# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=3.0.1
pkgrel=1
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL2')
depends=('python-pyqt6' 'mpv' 'ffmpeg' 'python-pillow')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/3.0.1/videocut3.0.1.tar)
md5sums=(58881dab2d762a613963dfdb65644d9f)

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


