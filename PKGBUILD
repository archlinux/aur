# Maintainer: Adiee5 <adiee5@adiee5.ct8.pl>

pkgname=nautilus-copy-file-contents-git
_reponame=nautilus-extension-copy-file-contents
pkgver=r3.b51e7b6
pkgrel=1
pkgdesc="Nautilus extension for copying the contents of the entire file"
arch=('any')
url="https://github.com/EuCaue/$_reponame"
license=('GPL-3.0-only')
depends=('python-nautilus' 'python-gobject' 'libnautilus-extension')
makedepends=('git' 'sed')
optdepends=() 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/EuCaue/$_reponame.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_reponame"
	_scriptname="$(printf ${pkgname%-git} | sed 's/-/_/g').py"
	install -Dm755 "src/$_scriptname" "$pkgdir/usr/share/nautilus-python/extensions/$_scriptname"
}
