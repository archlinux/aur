# Maintainer: Abd El-Twab M. Fakhry <abdeltwab.m.fakhry@gmail.com>

pkgname=nxprayer
pkgver=0.1.1.r61.a29f84e
pkgrel=1
pkgdesc="Islamic prayers reminder, for your status bar or/and scripts."
arch=('x86_64')
url="https://github.com/AbdeltwabMF/nxprayer.git"
license=('GPL-v3')
depends=(
    'jq'
		'awk'
		'sed'
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
		printf "%s.r%s.%s" "$(awk '/^VERSION =/ {print $3}' config.mk)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}"
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
