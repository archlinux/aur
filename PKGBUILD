# Maintainer: Talon Wettstein <talon@wettstein.qzz.io>

_pkgname="mystralnative"
pkgname="${_pkgname}-bin"
pkgver=0.1.5
pkgrel=2
pkgdesc="Native WebGPU JS runtime with SDL3 (V8 + Dawn)"
arch=(x86_64)
url="https://github.com/mystralengine/mystralnative"
license=(MIT)
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/mystral-linux-x64-v8-dawn.zip" mystral.sh)
sha512sums=('45fa7acf506d2b735a7ac86ea72e52fb82894fd8718f5494e198f74d604cd955933d5c70711fd9b8cc38f9926bfcade325a727c33c034ba6e12f4a4f14935085'
            'fd7845470231520ced644babb8d485fb50c1d406f7175841f1e1dca1f1b6c55cd6cb070003c6fd3a794ac95d256daf36b7ccb171590358df1d87b1faaa3298cc')

depends=(vulkan-icd-loader libx11 libxrandr libxcursor libxi)

provides=("${_pkgname}")
# In the event these packages exist,
# so we don't find naming conflicts.
conflicts=("${_pkgname}" "${_pkgname}-git")

package() {
	install -dm755 "${pkgdir}/opt/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	install -m755 "${srcdir}/mystral.sh" "${pkgdir}/usr/bin/mystral"

	cp -a   "${srcdir}/libSDL3.so" \
		"${srcdir}/libSDL3.so.0" \
		"${srcdir}/libSDL3.so.0.2.8" \
		"${pkgdir}/opt/${_pkgname}"

	install -m755 "${srcdir}/mystral" "${pkgdir}/opt/${_pkgname}/mystral"
}
