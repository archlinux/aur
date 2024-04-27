# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=3.1.4
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
sha256sums_x86_64=('3bb373e081daaf6bf179d7f83dd8fa39e491a6daa4250a1b7ac42850309cb313')
sha256sums_aarch64=('a984fc13a18e49c5072887de718640535aea4a4e626fb9e19791f94e977482a7')

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
