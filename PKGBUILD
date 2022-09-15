# Maintainer: Abd El-Twab M. Fakhry <abdeltwab.m.fakhry@gmail.com>

pkgname=next-prayer
pkgver=v0.3.0.r1.1827f55
pkgrel=1
pkgdesc="Islamic prayers reminder for your status bar."
arch=('x86_64')
url="https://github.com/AbdeltwabMF/next-prayer.git"
license=('GPL-v3')
depends=()
makedepends=(
	'git'
	'make'
	'python3'
)
optdepends=(
	'libnotify'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "%s.r%s.%s" "$(awk '/VERSION\[\] =/{print $5}' src/np_main.cpp | sed 's/\"\|;//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" all
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install clean
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
