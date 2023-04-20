# Originally: Ultraleap <info@ultraleap.com>
# Maintainer: Sam Bilbow <samuel.bilbow@icloud.com>
pkgname=openxr-layer-ultraleap
pkgver=1.3.1
pkgrel=1
epoch=
pkgdesc="Ultraleap OpenXR Hand Tracking API Layer. Enables Ultraleap hand-tracking on an existing OpenXR runtime"
arch=('x86_64')
url=""
license=('PROPRIETARY')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('openxr-layer-ultraleap')
conflicts=()
replaces=()
backup=()
options=()
install='openxr-layer-ultraleap.install'
changelog=
source=("https://repo.ultraleap.com/apt/pool/main/o/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
		'openxr-layer-ultraleap.conf')
noextract=()
md5sums=('ee1ba57a1b16711343d591069a5c9a00'
		 '378b1c86a576dc5ad4a6498e95d6925d')
validpgpkeys=()

prepare() {
    tar xzf "data.tar.gz"
}

package() {
	install -D -m644 "${srcdir}/usr/lib/${pkgname}/libUltraleapHandTracking.so.1.3.1.0" "${pkgdir}/usr/lib/${pkgname}/libUltraleapHandTracking.so.1.3.1.0"

	ln -s "libUltraleapHandTracking.so.1.3.1.0" "${pkgdir}/usr/lib/${pkgname}/libUltraleapHandTracking.so.1"
	ln -s "libUltraleapHandTracking.so.1" "${pkgdir}/usr/lib/${pkgname}/libUltraleapHandTracking.so"

	install -D -m644 "${srcdir}/usr/share/openxr/1/api_layers/implicit.d/XrApiLayer_Ultraleap.json" "${pkgdir}/usr/share/openxr/1/api_layers/implicit.d/XrApiLayer_Ultraleap.json"

	install -D -m644 "${srcdir}/openxr-layer-ultraleap.conf" "${pkgdir}/etc/ld.so.conf.d/openxr-layer-ultraleap.conf"
}
