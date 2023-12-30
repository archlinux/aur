# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

_name=delta-icon-theme
pkgname=${_name}-git
pkgver=r85.3fa71b7
pkgrel=1
pkgdesc="Matted out icon pack for Linux."
arch=('any')
license=('CC-BY-NC-SA-4.0')
url="https://delta-icons.github.io/"
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
source=("delta-icons-linux::git+https://github.com/Delta-Icons/linux.git"
	"license.txt")
sha256sums=('SKIP'
            '38762e3777f4ec00a6f769062a7c3f704fb78ce08303ecff88558da4c49cf9ea')
pkgver() {
	cd "$srcdir/delta-icons-linux"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -dm 755 "$pkgdir"/usr/share/icons
	install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${_name}/license.txt"
	cp -dr --no-preserve='ownership' "delta-icons-linux/Delta" "$pkgdir"/usr/share/icons/
}

