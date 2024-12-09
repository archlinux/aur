# Maintainer: hanker <91734413+hankertrix@users.noreply.github.com>
# Contributor: Perseo <pgutierrez@gmail.com>

_pkgname='xsct'
pkgname="$_pkgname-git"
pkgver='r48.c69fb96'
pkgrel=1
_gitname='sct'

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${_gitname}"
license=('Unlicense')
depends=('glibc' 'libx11' 'libxrandr')
makedepends=('git')
provides=('xsct')
conflicts=('xsct')
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 'xsct.1' "$pkgdir/usr/share/doc/$_pkgname"
}
