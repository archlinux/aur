# Maintainer: Adiee5 <adiee5@adiee5.ct8.pl>

_pkgname=nautilus-git-clone
pkgname=$_pkgname-git
pkgver=r2.ba25702
pkgrel=1
pkgdesc="Nautilus extension providing a GUI interface for cloning git repositories"
arch=('any')
url="https://codeberg.org/dz4k/$_pkgname"
license=('MIT')
depends=('git' 'nautilus-python' 'python-gobject' 'libnautilus-extension')
makedepends=() 
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 "$_pkgname.py" "$pkgdir/usr/share/nautilus-python/extensions/$_pkgname.py"
}
