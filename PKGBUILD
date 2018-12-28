# $Id$
# Maintainer: Samuel Williams (ioquatix)

pkgname=mailcap-mime-types
pkgver=2.1.48+14+g5811758
pkgrel=3
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
_commit=58117584fa573c92d918245d38269cc63cec5996  # master
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
