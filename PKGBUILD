# Maintainer: Olivier Mehani <shtrom-arch@ssji.net>

pkgname=m17n-im-shortname-unicode-emoji-git
pkgver=r9.d69fc3a
pkgrel=1
pkgdesc="Input method for Unicode Emoji using shortnames "
arch=('i686' 'x86_64')
url="https://github.com/EmptyStackExn/m17n-im-shortname-unicode-emoji"
license=()
depends=('ibus-m17n' 'ttf-symbola')
makedepends=('git' 'make' ) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
'm17n-im-shortname-unicode-emoji::git+https://github.com/EmptyStackExn/m17n-im-shortname-unicode-emoji'
'0001-Honour-PREFIX-and-DESTDIR-and-don-t-restart-when-ins.patch'
)

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	patch -p1 -i "${srcdir}/0001-Honour-PREFIX-and-DESTDIR-and-don-t-restart-when-ins.patch"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}/" install
}

md5sums=('SKIP'
         'd9cc64413864ef1f666a512f3b430d6d')
