# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=openvtuber
pkgver=1.0
pkgrel=1
pkgdesc='Real-time face and gaze analyzation via deep neural networks.'
arch=('any')
url='https://github.com/1996scarlet/OpenVtuber'
license=('GPL3')
depends=('npm' 'python' 'python-bidict' 'python-engineio' 'python-opencv'
         'python-socketio' 'python-tensorflow' 'python-websocket-client'
         'yarn')
optdepends=()
makedepends=()
source=("$pkgname::git+$url.git#tag=v$pkgver-2019")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  cd NodeServer
  yarn
  cd ..
  make -C ./PythonClient/rcnn/
}

package() {
  cd "${pkgname}"

  mkdir -p $pkgdir/lib/openvtuber
  mkdir -p $pkgdir/share/openvtuber

  cp -r NodeServer $pkgdir/lib/openvtuber
  cp -r PythonClient $pkgdir/lib/openvtuber

  install -m 644 vtuber.html $pkgdir/lib/openvtuber
  install -m 644 Readme.md $pkgdir/share/openvtuber/Readme.md

  chmod -R 644 $pkgdir/lib/openvtuber
}

# vim: ts=2 sw=2 et:
