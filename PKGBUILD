# Maintainer: Samuel Williams (ioquatix)

pkgname=mailcap-mime-types
pkgver=2.1.49
pkgrel=1
pkgdesc="A modern /etc/mime.types file from mailcap"
url="https://pagure.io/mailcap"
arch=(any)
license=(MIT)
makedepends=(git)
checkdepends=(python)
provides=(mime-types mailcap)
conflicts=(mime-types mailcap)
replaces=(mime-types)
backup=(etc/mime.types)
_commit=9c916595f1a1a4ae794fb67619c15fbc77905e31  # master
source=("git+https://pagure.io/mailcap#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd mailcap
  git describe --tags | sed 's/^r//;s/-/./;s/-/./;s/-/+/g'
}

check() {
  cd mailcap
  make check
}

package() {
  cd mailcap
  install -Dpm 644 mime.types "$pkgdir/etc/mime.types"
}
