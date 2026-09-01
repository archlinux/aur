# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arika0093
_pkgname=console2svg
pkgname=${_pkgname}-bin
pkgdesc="Easily convert terminal output into SVG images"

pkgver=0.8.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'resvg' 'ffmpeg')

options=('!strip')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('abb7216dfcaa70b80100f6af9cc17d2c1615d9c730329303d4ff043a5360e3ff'
            '98777468c101698f56a7e16011578e44db2c1fb6c5b70f614f1fc3be6d551d36')
sha256sums_x86_64=('dd110fbe09542eaf44d7557459630665873b0257ad7f8a8ba0ef9b61435b0f8f')
sha256sums_aarch64=('82cf2e35c067107b524a8b6d4c6fc0d7d164ad0ab231dfc08c70e3e588d3f70f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dm755 "lib${_pkgname}_resvg.so" -t "${pkgdir}/usr/lib/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
