# Maintainer: Kanehekili (mat dot wegmann at gmail dot com)
pkgname=videocut
pkgver=3.0.6
pkgrel=5
pkgdesc="Fast mp4/matroska/Av1/webm/mp2/mpts lossless Video cutter"
url="https://github.com/kanehekili/VideoCut"
license=('GPL-3.0-or-later')
depends=('python-pyqt6' 'mpv' 'ffmpeg<2:9.0' 'python-pillow' 'gcc')
arch=('x86_64')
source=(https://github.com/kanehekili/VideoCut/releases/download/3.0.6/videocut3.0.6.tar)
md5sums=(0933d23a62993de0120be0d9d69d530a)

build() {
  CC=gcc make -C "${pkgname}/ffmpeg/src/" -f makefile all
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm 644 *.py -t "${pkgdir}/opt/videocut"
  rm ${pkgdir}/opt/videocut/FFMPEGTests.py
  install -Dm 755 VideoCut.py -t "${pkgdir}/opt/videocut"
  find data icons lib -type f \
    -exec install -Dm 644 "{}" "${pkgdir}/opt/videocut/{}" \;
  install -Dm 755 "ffmpeg/src/remux5" -t "${pkgdir}/opt/videocut/ffmpeg/bin"

  install -Dm 644 "VideoCut.desktop" -t "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/videocut/VideoCut.py" "${pkgdir}/usr/bin/videocut"
}
