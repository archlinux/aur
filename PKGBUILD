# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Luna Aphelion <luna-aphelion@proton.me>

## GPG key: https://github.com/xXTacticalWaffleXx.gpg

pkgname=minfetch-git
_pkg="${pkgname%-git}"
pkgver=r77.05c20ab
pkgrel=1
pkgdesc="Simple and customisable fetch script"
arch=('any')
url="https://github.com/xXTacticalWaffleXx/minfetch"
license=('GPL3')
depends=('bash')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')
validpgpkeys=('A09118B2E92DE87846FD9F8D0298164A5CE73DA4') ## Luna Aphelion

pkgver() {
	cd "$_pkg"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
}

package() {
	cd "$_pkg"
	install -D "$_pkg" -t "$pkgdir/usr/bin/"
}
