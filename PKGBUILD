# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=dust3d
_pkgver=1.0.0-rc.9
pkgver="${_pkgver//-/}"
pkgrel=1
pkgdesc="3D watertight modeling software"
url="https://dust3d.org/"
license=('MIT')
depends=('qt5-base' 'qt5-svg')
makedepends=('boost' 'cmake' 'qt5-tools')
arch=('x86_64')

source=(
  "dust3d-$_pkgver.tar.gz::https://github.com/huxingyi/dust3d/archive/$_pkgver.tar.gz"
  'dust3d.desktop'
  'cstdint.patch'
)
sha256sums=(
  '266c70166c96de550f504387cfe34c870ea2fbb376560511a38114e17836869b'
  'f4742bc1a2795b435f8343f20516763522b8f710fefbb3e75ce7a02ea634a691'
  '1c3522dbd6e90cdda7c9572c35ed0f57a5c310e2dc0a2d8affafded9401b0612'
)

prepare() {
  cd "$srcdir/dust3d-$_pkgver"
  patch -p0 -i "$srcdir/cstdint.patch"
}

build() {
  cd "dust3d-$_pkgver/application"
  qmake
  make
}

package() {
  install -t "$pkgdir/usr/share/applications" -Dm644 dust3d.desktop
  cd "$srcdir/dust3d-$_pkgver"
  install -t "$pkgdir/usr/bin" -D application/dust3d
  install -t "$pkgdir/usr/share/licenses/dust3d" -Dm644 LICENSE
}
