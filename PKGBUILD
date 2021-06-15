# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: FabioLolix <fabio.loli@disroot.org>
# Contributor: cobaltspace <cobaltspace@protonmail.com>

_pkgname=OpenVtuber
pkgname=openvtuber
_pkgver=1.0-2019
pkgver=${_pkgver//-/.}
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
source=("$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  cd NodeServer
  yarn
  cd ..
  make -C ./PythonClient/rcnn/
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"

  mkdir -p $pkgdir/lib/openvtuber
  mkdir -p $pkgdir/share/openvtuber

  cp -r NodeServer $pkgdir/lib/openvtuber
  cp -r PythonClient $pkgdir/lib/openvtuber

  install -m 644 vtuber.html $pkgdir/lib/openvtuber
  install -m 644 Readme.md $pkgdir/share/openvtuber/Readme.md

  chmod -R 644 $pkgdir/lib/openvtuber
}

# vim: ts=2 sw=2 et:
