# Maintainer: Kazoku <k4zoku@pm.me>
pkgname=tosu-overlay
pkgver=v1.0.1
pkgrel=1
pkgdesc="Overlay for osu! Powered by Tosu, GTK and Webkit"
arch=('x86_64')
url="https://github.com/K4zoku/tosu-overlay"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'gtk-layer-shell')
makedepends=('make' 'pkgconf' 'clang')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("tosu-overlay::git+https://github.com/K4zoku/tosu-overlay.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
	make BUILD_PROFILE=RELEASE
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/kglobalaccel"

	cd "${srcdir}/${pkgname}"
	make PREFIX="${pkgdir}/usr" install
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "distribution/app.tosu.overlay.desktop" "${pkgdir}/usr/share/applications/tosu-overlay.desktop"
    ln -s "${pkgdir}/usr/share/applications/tosu-overlay.desktop" "${pkgdir}/usr/share/kglobalaccel/app.tosu.overlay.desktop"
}
