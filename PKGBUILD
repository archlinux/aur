# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arika0093
_pkgname=console2svg
pkgname=${_pkgname}-bin
pkgdesc="Easily convert terminal output into SVG images"

pkgver=0.9.0
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
sha256sums=('fa7331c4d23696faa51640b5bf06d4d813d05fc9a9c8c4cdc958ddbb4c91ee2d'
            '98777468c101698f56a7e16011578e44db2c1fb6c5b70f614f1fc3be6d551d36')
sha256sums_x86_64=('635f4ea46ac2e2628ca6cc9ba54a8289bbcc4aaa2a8b0c13440d030a914ba2a9')
sha256sums_aarch64=('6a54c033360501cad539ca63adb30de4456b33589379a5c65e51c97ffd625388')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dm755 "lib${_pkgname}_resvg.so" -t "${pkgdir}/usr/lib/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
