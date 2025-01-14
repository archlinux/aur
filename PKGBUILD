# Maintainer: Matthew Hiles <matthew.hiles@gmail.com>
pkgname=inkscape-silhouette-git
pkgver=r685.7eac606
pkgrel=1
pkgdesc="inkscape plugin to control Silhouette vinyl cutters"
arch=(any)
url="https://github.com/fablabnbg/inkscape-silhouette"
license=('GPLv2')
groups=()
depends=(inkscape python-lxml python-pyusb python-tinycss2 python-matplotlib)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	'git+https://github.com/fablabnbg/inkscape-silhouette'
	'Vinyl Full Sheet 12x24.svg'
	'Vinyl Half Sheet 12x12.svg')
noextract=()
sha256sums=(
	'SKIP'
    'b74f9b112d01eb722e434b98ca7a4b8dd053c706a25af7e9372ef73ca24b2819'
    '46816dc07cfd637e73738fd9f3675d3222277e43a8ecd8e9bc63fd20078945a7')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	set > /tmp/env
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	cp "${startdir}"/*.svg "$pkgdir/usr/share/inkscape/templates/"
}
