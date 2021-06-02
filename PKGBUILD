# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=openvtuber
pkgname=$_pkgname-git
pkgver=v1.0+2019+27+g970229d
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
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}"
  cd NodeServer
  yarn
}

package() {

  mkdir -p $pkgdir/lib/openvtuber
  mkdir -p $pkgdir/share/openvtuber
  cp -r $pkgname/* $pkgdir/lib/openvtuber/
  chmod -R 644 $pkgdir

  cd $pkgname

  install -m 644 LICENSE $pkgdir/share/openvtuber
  install -m 644 Readme.md $pkgdir/share/openvtuber/Readme.md
}

# vim: ts=2 sw=2 et:
