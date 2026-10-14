# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=mujoco-bin
pkgver=3.16.0
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
sha256sums_x86_64=('139577c541d43716a63992ab698cbc7b09788b1d547fb82b682d59b40ef49b9d')
sha256sums_aarch64=('2872f91a29dc4bb3c117ec38e156b4a34e6fb8082a47fe3a23e3788ccebc3595')

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
