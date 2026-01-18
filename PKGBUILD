# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wcampbell0x2a
_pkgname=backhand
pkgname=${_pkgname}-bin
pkgver=0.24.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Read, create and modify SquashFS File Systems"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0' 'MIT')

conflicts=("${_pkgname}")
provides=('add-backhand' 'replace-backhand' 'unsquashfs-backhand')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('a197acb092a4845ef6a18097e1d3fb3e7e448243e4a8535ca4f59fffa42f021f'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            'fd26644b0118c8ae84a8770bdbbe18f7db14387b5cc19d1de670ad2d98a7ad42')
sha256sums_x86_64=('9dbf5d8a3947ce20cf19bee2988b2e631263fc49e52d5748b860a4049872e324')
sha256sums_aarch64=('3f65af063c6f6c427d078685fd5eac63043e6a4414232faa854bc23e19fd273c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
	install -Dm755 "${provides[1]}" "${pkgdir}/usr/bin/${provides[1]}"
	install -Dm755 "${provides[2]}" "${pkgdir}/usr/bin/${provides[2]}"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
