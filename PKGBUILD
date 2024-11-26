# Contributor: Beshr Ghalil <bshrghalil@gmail.com>

pkgname=todome-git
_pkgname=todome
pkgver=r44.9892972
pkgrel=1
epoch=1
pkgdesc="Language agnostic tool that collects TODOs, FIXMEs ,BUGs, NOTEs and DONEs in the source code."
arch=('x86_64' 'i686')
url="https://www.github.com/BishrGhalil/todome.git"
license=('GPL-2.0-or-later')
depends=('pcre')
makedepends=('git')
provides=('todome')
conflicts=('todome')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make -C src
}

package() {
	cd "$_pkgname"
	install -Dm755 src/todome -t "${pkgdir}/usr/bin"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
