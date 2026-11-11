# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=4.0.1
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
sha256sums_x86_64=('8df1308b2900a4ed6c18717ebbc9d66d53ab3fe7a4da860a7d5b21f94607299d')
sha256sums_aarch64=('e16dc0ed24d31279bce674bd03b9f8ef75f209d1189befe67b7c3b366978a6b3')

package() {
	cd "${_pkgname}-${pkgver}"

	# Library and header files
	install -d "$pkgdir/usr/"
	cp -r include/mujoco "$pkgdir/usr/mujoco"
	cp -r lib "$pkgdir/usr/"

	# Sample binaries
	cp -r bin "$pkgdir/usr/lib/${_pkgname}"

	# Sample code and models -- install as documentation
	install -d "$pkgdir/usr/share/doc/${_pkgname}"
	cp -r model "$pkgdir/usr/share/doc/${_pkgname}/"
	cp -r sample "$pkgdir/usr/share/doc/${_pkgname}/"
	cp -r simulate "$pkgdir/usr/share/doc/${_pkgname}/"

	# License
	install -Dm644 -t "$pkgdir/usr/share/licenses/${_pkgname}/" \
		THIRD_PARTY_NOTICES
}
