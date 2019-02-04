# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=batmon-git
pkgver=r5.2b8ae64
depends=('python')
makedepends=()
pkgrel=1
arch=(any)
pkgdesc="Monitores the battery level and saves somewhere for future analysis"
license=("custom")
options=(!strip)
url="https://github.com/lucasew/batmon"
install=batmon-git.install
source=("batmon::git+https://github.com/lucasew/batmon/")
sha256sums=("SKIP")

pkgver() {
  cd "batmon"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    mkdir $pkgdir/usr/bin -p
    cp $srcdir/batmon/batmond $pkgdir/usr/bin
    chmod +x $pkgdir/usr/bin/batmond
    mkdir $pkgdir/etc/systemd/system -p
    cp $srcdir/batmon/batmond.service $pkgdir/etc/systemd/system
}
