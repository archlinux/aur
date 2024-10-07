# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=3.0.3
pkgrel=1
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL2')
depends=('python-pyqt6' 'mpv' 'ffmpeg' 'python-pillow')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/3.0.3/videocut3.0.3.tar)
md5sums=(03dff34d5963fe4bb9f786707c1da191)

build() {
  make -C ${pkgname}/ffmpeg/src/ -f makefile all clean
}

package(){	
  cd ${srcdir}
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/bin"
  rm  $srcdir/$pkgname/install.sh
  rm  $srcdir/$pkgname/uninstall.sh
  rm -rf  $srcdir/$pkgname/ffmpeg/bin/V*/
  chmod +x $srcdir/$pkgname/ffmpeg/bin/remux5
  cp  $srcdir/$pkgname/VideoCut.desktop "${pkgdir}/usr/share/applications"
  cp -r $srcdir/$pkgname/* "${pkgdir}/opt/${pkgname}"
  ln -s /opt/videocut/VideoCut.py  ${pkgdir}/usr/bin/videocut
}


