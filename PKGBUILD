# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=kmozillahelper
pkgname=$_pkgname-bin
pkgver=5.0.6
pkgrel=3
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
makedepends=(
  curl
  jq
)
provides=($_pkgname)
conflicts=($_pkgname)

_opensuse="Tumbleweed"
# RPM
case $CARCH in
  pentium4) _arch=i586 ;;
  i686) _arch=i586 ;;
  armv7h) _arch=armv7hl ;;
  *) _arch="$CARCH" ;;
esac
case $_arch in
  x86_64 | i586) # Use mozilla repo
    _repo=https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/$_arch
    ;;
  *) # Use official (ports) repo
    _repo=https://download.opensuse.org/ports/$_arch/${_opensuse,,}/repo/oss/$_arch
    ;;
esac
_rpm="$(curl $_repo/?jsontable | jq "[.data[] | select(.name | test(\"^$_pkgname-\\\\d\")) | .name] | max" | tr -d '\"')"
if [[ -z $_rpm ]]; then
   exit 1
fi
source=($_repo/$_rpm)
sha256sums=(SKIP)

# Build package
package() {
  mv "$srcdir/usr" "$pkgdir/usr"
}
