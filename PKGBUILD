# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=kanshi
pkgver=1.0.0
pkgrel=1
pkgdesc='Dynamic output configuration for Wayland WMs'
arch=(x86_64)
url='https://wayland.emersion.fr/kanshi/'
license=('MIT')
makedepends=('meson' 'scdoc')
depends=('wayland')
source=("https://github.com/emersion/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('90b200107b32b72259d60bfc08b12c782b13e706b7e617d058df292506fdbf90')

build() {
	meson --prefix=/usr --buildtype=plain "${srcdir}/${pkgname}-${pkgver}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -D -m 0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/kanshi/LICENSE"
}
