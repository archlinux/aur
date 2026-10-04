# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=brash-git
pkgver=r33.6db2d9f
pkgrel=2
pkgdesc="Move and restore items from the XDG trash, written in pure Bash"
arch=('any')
url="https://github.com/zakariagatter/brash"
license=('MIT')
depends=('bash' 'coreutils' 'dialog')
makedepends=('git')
provides=('brash')
conflicts=('brash')
source=("brash::git+https://github.com/zakariagatter/brash.git")
sha256sums=('SKIP')

pkgver() {
	cd brash
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd brash
	install -Dm755 bin/brash "$pkgdir/usr/bin/brash"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -d "$pkgdir/usr/share/doc/$pkgname/preview"
	install -Dm644 preview/*.png "$pkgdir/usr/share/doc/$pkgname/preview/"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
