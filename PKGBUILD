# Maintainer: Kookies <kookies@tutamail.com>
_pkgbase=openrevolution
pkgname="${_pkgbase}-git"
pkgver=v2.7.0.r16.g54281d7
pkgrel=1
pkgdesc="C/C++ BRSTM and other format tools"
arch=('x86_64')
url="https://github.com/ic-scm/openrevolution"
license=('GPL3')
makedepends=('git')
optdepends=('ffmpeg')
provides=($_pkgbase)
conflicts=($_pkgbase)
source=(
	"$_pkgbase"::"git+https://github.com/ic-scm/openrevolution"
	00-skiprtbuild.patch
)
b2sums=('SKIP'
	'676a1ee540097f44115ff39db572c13053fa4d04b8931f7db37cd09eb019810d7e329fc0ac74fd4efdfe0c714bc3cd2d667198ae13c58ceef152ac8891705fce'
)

prepare() {
  cd "$srcdir/$_pkgbase/"
  patch --forward --strip=1 ../../00-skiprtbuild.patch
}	

pkgver() {
  cd "$srcdir/$_pkgbase/"
  git describe --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase/"
  sh build.sh
}

package() {
  cd "$srcdir/$_pkgbase"
  install -m755 -D 'brstm_converter' "$pkgdir/usr/bin/"
  install -m755 -D 'brstm_decoder' "$pkgdir/usr/bin/"
  install -m755 -D 'brstm_encoder' "$pkgdir/usr/bin/"
  install -m755 -D 'brstm_reencoder' "$pkgdir/usr/bin/"
  install -m755 -D 'brstm_rebuilder' "$pkgdir/usr/bin/"
}
