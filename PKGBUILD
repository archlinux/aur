# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=smt-manager-git
_pkgname=smt-manager
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=r22.2e6f1ef
pkgrel=1
pkgdesc='Enable or disable logical cores, or display your current CPU topology.'
arch=('any')
url="https://github.com/damentz/${_pkgname}"
license=('GPL2')
depends=('perl')
makedepends=('git')
source=("git+https://github.com/damentz/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  ( set -o pipefail
    git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 'smt-manager.pl' "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
