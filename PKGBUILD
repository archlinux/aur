# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=kmozillahelper
pkgname=$_pkgname-bin
pkgver=5.0.6
pkgrel=2
pkgdesc="KDE mozilla integration"
arch=(x86_64 pentium4 i686 aarch64 armv7h)
url="https://github.com/openSUSE/kmozillahelper"
license=(MIT)
depends=(
  kio5
  ki18n5
  knotifications5
  kwindowsystem5
)
provides=($_pkgname)
conflicts=($_pkgname)

# RPM
case $CARCH in
  pentium4) _arch=i586 ;;
  i686) _arch=i586 ;;
  armv7h) _arch=armv7hl ;;
  *) _arch=$CARCH ;;
esac
case $_arch in
  x86_64 | i586) # Use mozilla repo
    _opensuse="Tumbleweed"
    _rpmrel="19.2"
    source=("https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/$_arch/$_pkgname-$pkgver-$_rpmrel.$_arch.rpm")
    ;;
  *) # Use official repo
    _opensuse="tumbleweed"
    _rpmrel="2.1"
    source=("https://download.opensuse.org/ports/$_arch/$_opensuse/repo/oss/$_arch/$_pkgname-$pkgver-$_rpmrel.$_arch.rpm")
    ;;
esac
case $_arch in
  x86_64) sha256sums=("78dfae820ad5dd5560f90bdd48df07a37fb4c8a27c86e44f8ea661a86660ab02") ;;
  i586) sha256sums=("4c977ed1eead8a5784b7acac20f37686c5131465289a38db880dc8b96eedbdc7") ;;
  aarch64) sha256sums=("612e14be1b6985f289148f2c8d97f66e1eb5f10890bfc00ad701dd520b283a84") ;;
  armv7hl) sha256sums=("8859df56bd795d30824518d3db73e0e894c34b184e4bfb140efccc5e1ab3d434") ;;
  *) sha256sums=(SKIP) ;;
esac

# Build package
package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
