# Maintainer: Mattheus Roxas <thepogsupreme@tuta.io>
_pkgname="amogu.sh" # Thanks,
pkgname="$_pkgname-git" # Dawid.
pkgver=r3.fad5425
pkgrel=1
pkgdesc="A posix shell image viewer utilizing fzf, with Überzug for previews. Copies your selection to the clipboard."
arch=('x86_64')
url="https://codeberg.org/thepogsupreme/amogu.sh"
license=('EUPL 1.2')
depends=('fzf' 'ueberzug')
makedepends=('git')
optdepends=('xclip: Clipboard support' 'dragon-drag-and-drop: Drag and drop support')
source=('amogu.sh::git+https://codeberg.org/thepogsupreme/amogu.sh.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dm755 ./amogu.sh "$pkgdir/usr/bin/amogu.sh"
	install -g 0 -o 0 -m 0644 "$_pkgname".1 /usr/local/man/man1/
	gzip /usr/local/man/man1/"$_pkgname".1
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
