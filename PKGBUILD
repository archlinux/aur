# Maintainer: Leon Plickat <leonhenrik.plickat@stud.uni-goettingen.de>

pkgname=lavalauncher
pkgver=1.6
pkgrel=1
pkgdesc='A simple launcher panel for Wayland'
arch=(x86_64)
url='https://git.sr.ht/~leon_plickat/lavalauncher'
license=(GPL3)
depends=(cairo wayland wayland-protocols scdoc)
makedepends=(git gcc meson ninja)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	printf "1.6"
}

prepare()
{
	cd "${pkgname%-*}"
	git checkout v1.6
}

build()
{
	cd "${pkgname%-*}"
	rm -fr build
	meson build \
		--prefix /usr
	ninja -C build
}

package()
{
	cd "${pkgname%-*}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
