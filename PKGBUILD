# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=systemd-metered-connection-dependency-git
pkgver=r12.641eaca
pkgrel=1
pkgdesc="Execute systemd services if current connection is not metered."
arch=('any')
url="https://github.com/jdorel/systemd-metered-connection-dependency"
license=('GPL3')
depends=('systemd')
makedepends=('git')
source=("${pkgname}::git+https://github.com/jdorel/systemd-metered-connection-dependency.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  install -Dm644 unmetered-connection.service "$pkgdir/usr/lib/systemd/system/unmetered-connection.service"
  install -Dm755 check-metered-connection.sh "$pkgdir/usr/bin/check-metered-connection.sh"
}
