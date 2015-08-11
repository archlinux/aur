# Maintainer:  Justin R. St-Amant <jstamant24 at gmail dot com>
# Contributor: Tim Hatch <tim@timhatch.com>

pkgname=openscam
pkgver=0.0.11
pkgrel=2
pkgdesc="Open-Source software which can simulate 3-axis NC machining. It is a fast, flexible and user friendly simulation software for the DIY and Open-Source community."
arch=('i686' 'x86_64')
url="http://www.openscam.com/"
license=('GPL2')
depends=('bzip2' 'zlib' 'expat' 'openssl' 'boost-libs' 'sqlite' 'libxml2'
'libgl' 'gts' 'libglade' 'gtkglext' 'glew' 'freeglut' 'dxflib' 'libffi')
makedepends=('scons' 'boost')
optdepends=()
source=(http://openscam.com/releases/alpha/release/openscam/debian-testing-64bit/v0.0/${pkgname}_${pkgver}.tar.bz2 fix-packager-detection.diff)

build() {
  cd "$srcdir/${pkgname}_$pkgver/"
  patch -p1 < ../fix-packager-detection.diff
  # Explicitly specify gnu compiler, because otherwise it may use the Intel
  # compiler (if installed), which has a different boost, and causes problems.
  # Note that this takes $MAKEFLAGS with the intention of specifying -j only,
  # other args may confuse scons.
  scons $MAKEFLAGS -C cbang compiler=gnu
  scons $MAKEFLAGS compiler=gnu
}

package() {
  cd "$srcdir/${pkgname}_$pkgver/"
  scons install compiler=gnu install_prefix="$pkgdir/usr/"
}

md5sums=('6ccc539decbf4ffd0612b4a5f995923c' 'f7d6b975f1900a2d04a5776fabc22a77')
# vim:set ts=2 sw=2 et:
