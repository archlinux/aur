# Maintainer: libele <libele@disroot.org>

_pkgname=dust3d
pkgname="${_pkgname}-git"
pkgver=1.0.0.rc.7.r27.g3a0d07b
pkgrel=1
pkgdesc="3D watertight modeling software (git version)"
url="https://dust3d.org/"
license=('MIT')
depends=('qt5-base' 'qt5-svg')
makedepends=('git') #'qt5-tools')
arch=('aarch64' 'x86_64')

source=('git+https://github.com/huxingyi/dust3d'
	'dust3d.desktop')
md5sums=('SKIP'
	 '063ee64a0c73d48400176ad240f5a9db')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/application"
  qmake
  make
}

package() {
  install -t "$pkgdir/usr/share/applications" -Dm644 dust3d.desktop

  cd "$srcdir/$_pkgname"
  install -t "$pkgdir/usr/bin" -D application/dust3d
  install -t "$pkgdir/usr/share/licenses/dust3d" -Dm644 LICENSE
}
