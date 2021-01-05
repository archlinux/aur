# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=tau-editor
pkgver=0.11.3
pkgrel=2
pkgdesc="GTK frontend for the Xi text editor, written in Rust"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.gnome.org/World/tau"
license=('MIT')
depends=(
	xi-core
	libhandy0
	vte3
)
makedepends=(
	git
	meson
	rust
)
provides=(tau-editor)
conflicts=(tau-editor)
source=("https://gitlab.gnome.org/World/Tau/uploads/b5f24cd692ec0c2a2c2be460fffaf505/tau-0.11.3.tar.xz")
sha256sums=('36e915de4ca906599b4ad176d4e2d625b454801a09ca0d4b0a1fbaf14915e60e')


build() {
	arch-meson -Dxi-core=system -Dlibhandy=enabled "tau-${pkgver}" build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="${pkgdir}" meson install -C build
	install -Dm 644 "tau-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
