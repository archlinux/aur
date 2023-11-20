# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_pkgname=community-configs-for-protopedal
pkgname=community-configs-for-protopedal-git
provides=($_pkgname)
pkgver=1.0
pkgrel=2
pkgdesc="Community-sourced configurations for protopedal."
arch=('any')
url="https://github.com/Lawstorant/community-configs-for-protopedal"
license=('GPL3')
depends=(
  bash
  joyutils
  protopedal
)
makedepends=(
  git
  make
  sed
)
source=(
  git+https://github.com/Lawstorant/community-configs-for-protopedal
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  cd "$srcdir/$_pkgname"
  make prefix="$pkgdir" install
  
  echo ""
  echo " If you want to use installed configurations without system restart"
  echo " execute following commands:"
  echo ""
  echo " # systemctl daemon-reload"
  echo " # udevadm control --reload"
  echo " # udevadm trigger"
  echo ""
}
