# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.
# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=domjura-git
pkgver=r149.b1e4a1d
pkgrel=1
pkgdesc="DOMjudge Results Application"
arch=('x86_64' 'i686')
url="https://github.com/nickygerritsen/DOMjura"
license=('MIT')
depends=('qt5-base'
'ttf-dejavu'
)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/nickygerritsen/DOMjura"
"DOMjura.desktop"
)
sha256sums=('SKIP'
            '522c8ac4b2a2831d9ac4ba1d25ec3b767de228873428dcb5eda48ace6a516e6e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D DOMjura "$pkgdir/usr/bin/DOMjura"
	install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

	install -D -m644 "$srcdir/DOMjura.desktop" "$pkgdir/usr/share/applications/DOMjura.desktop"
	for size in 16 32 48 64 128 256; do
		install -D -m 644 resources/image-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/DOMjura.png"
	done
}
