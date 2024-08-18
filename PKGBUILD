# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=3.2.2
_pkgname="${pkgname%-bin}"
pkgrel=1
pkgdesc="Multi-Joint dynamics with Contact. A general purpose physics simulator."
arch=('x86_64' 'aarch64')
url="https://www.mujoco.org"
license=('Apache')
depends=('libgl' 'glfw')
provides=('mujoco')
conflicts=('mujoco')
_src_url_prefix="https://github.com/deepmind/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux"
source_x86_64=("${_src_url_prefix}-x86_64.tar.gz")
source_aarch64=("${_src_url_prefix}-aarch64.tar.gz")
sha256sums_x86_64=('2802ee237d3c9e187d9c8bf83188d1ac6c3a92460343e26fa23d41fcd8425490')
sha256sums_aarch64=('6ff6d3634e84a176fdf44af3fe565f59665480fc8a293fbef2af6210c8f3688b')

package() {
	cd "${_pkgname}-${pkgver}"

	# Library and header files
	install -d "$pkgdir/usr/"
	cp -r include "$pkgdir/usr/"
	cp -r lib "$pkgdir/usr/"

	# Sample binaries
	cp -r bin "$pkgdir/usr/lib/${_pkgname}"

	# Sample code and models -- install as documentation
	install -d "$pkgdir/usr/share/doc/${_pkgname}"
	cp -r model "$pkgdir/usr/share/doc/${_pkgname}/"
	cp -r sample "$pkgdir/usr/share/doc/${_pkgname}/"

	# License
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}/" \
		THIRD_PARTY_NOTICES
}
