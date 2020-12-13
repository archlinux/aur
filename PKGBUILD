# Maintainer: thaliarchos <thaliarchos at protonmail dot com>
pkgname=bookmenu-git
pkgver=r76.930a68c
pkgrel=1
pkgdesc="Command line interface ebooks browser and downloader for LibGen using the InterPlanetary File System."
arch=('any')
url="https://github.com/kusky3/bookmenu"
license=('GPL')
groups=()
depends=('chafa' 'wget')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	'git+https://github.com/kusky3/bookmenu'
	'use_wget.patch'
)
noextract=()
md5sums=(
	'SKIP'
	'7aaba52c2b2f95e730813cefb1b84bd9'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git apply "../use_wget.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
