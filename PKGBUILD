# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

_pkgname=openvtuber
pkgname=$_pkgname-git
pkgver=v1.0+2019+27+g970229d
pkgrel=1
pkgdesc='Real-time face and gaze analyzation via deep neural networks.'
arch=('any')
url='https://github.com/1996scarlet/OpenVtuber'
license=('GPL3')
depends=('npm' 'opencv' 'python' 'python-bidict' 'python-engineio'
         'python-socketio' 'python-tensorflow' 'python-websocket-client'
         'tensorboard' 'yarn')
provides=($_pkgname)
conflicts=($_pkgname)
optdepends=()
makedepends=('git')
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

  mkdir -p $pkgdir/usr/lib/openvtuber
  mkdir -p $pkgdir/usr/share/openvtuber
  cp -r $pkgname/* $pkgdir/usr/lib/openvtuber
  chmod -R 755 $pkgdir
  chmod 755 $pkgdir/usr/lib/openvtuber

  cd $pkgname

  install -m 644 LICENSE $pkgdir/usr/share/openvtuber
  install -m 644 Readme.md $pkgdir/usr/share/openvtuber/Readme.md
}

# vim: ts=2 sw=2 et:
