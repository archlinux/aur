# Maintainer: Abd El-Twab M. Fakhry <abdeltwab.m.fakhry@gmail.com>

pkgname=nxprayer
pkgver=.r55.6af6d92
pkgrel=1
epoch=1
pkgdesc="Time of the next Islamic prayer for your status bar or scripts."
arch=('x86_64' 'i686')
url="https://github.com/AbdeltwabMF/nxprayer.git"
license=('GPL-v3')
depends=(
    'jq'
    'gawk'
    'bash'
    'libnotify'
)
makedepends=(
    'git'
    'make'
    'gcc'
    'python3'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "%s.r%s.%s" \
			"$(awk '/^VERSION =/ {print $3}' Makefile)" \
			"$(git rev-list --count HEAD)" \
			"$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir"
}

package() {
	cd "${pkgname}"
	make DESTDIR="$pkgdir" install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "${pkgname}.1" "${pkgdir}/usr/local/share/man/man1/${pkgname}.1"
}
