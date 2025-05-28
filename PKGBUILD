# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=simracing-hwdb
pkgname=simracing-hwdb-git
pkgver=1.0
pkgrel=2
pkgdesc="Collection of hwdb entries for various simracing equipment to fix detection in games/proton"
arch=('any')
url="https://github.com/JacKeTUs/simracing-hwdb"
license=('GPL2')
depends=(
  systemd
)
makedepends=(
  git
  findutils
)
source=(
  git+https://github.com/JacKeTUs/$_reponame
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  mkdir -p $pkgdir/usr/lib/udev/hwdb.d

  cd "$srcdir/$_reponame"
  ls | grep ".hwdb" | xargs -I {} install -m644 ./{} $pkgdir/usr/lib/udev/hwdb.d/{}
}
