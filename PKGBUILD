# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-kde-theme-git
_pkgname=Sweet-kde
pkgver=r67.051c50f
pkgrel=1
pkgdesc="Sweet KDE Plasma theme"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('CC-BY-SA-4.0')
makedepends=(
	'git'
)
depends=(
	'candy-icons-git'
)
optdepends=(
	'cantarell-fonts: tertiary font face defined'
	'beautyline: alternative icons set'
	'sweet-cursors-git: KDE cursors'
	'sweet-kvantum-git: kvantum theme'
	'sweet-folders-git: folder icons'
)
conflicts=(
	'plasma5-themes-sweet-kde-git'
	'plasma5-themes-sweet-full-git'
)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm755 "$pkgdir/usr/share"

	# KDE Plasma components
	cp -r "$srcdir/$_pkgname/aurorae" "$pkgdir/usr/share/aurorae"
	cp -r "$srcdir/$_pkgname/color-schemes" "$pkgdir/usr/share/color-schemes"

	# look-and-feel and desktoptheme
	cp -r "$srcdir/$_pkgname/plasma" "$pkgdir/usr/share/plasma"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_pkgname/LICENSE/"*.md
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/$_pkgname/README.md"
}
