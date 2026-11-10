# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=41
pkgdesc="Real-time space simulation"
arch=('x86_64')
url="https://celestiaproject.space/"
license=('GPL-2.0')

conflicts=("${_pkgname}")
provides=("${_pkgname}" 'libcspice.so')

depends=('glibc' 'libstdc++' 'libepoxy' 'libavif' 'luajit' 'libjpeg-turbo' 'libpng' 'ffmpeg' 'icu' 'fmt' 'freetype2' 'qt6-base' 'meshoptimizer' 'gltfpack')

_download_url="https://download.opensuse.org/repositories/home:/munix9:/celestia:/1.7/Arch/x86_64/"
_archive_extension="pkg.tar.zst"
_celestia_ui="qt6"

_version_cspice="67-8.1"
_version_celestia_app="git20261108+ec1740b-4.1"
_version_celestia_data="git20261108+457e4ee-2.1"

source=(
	"$_download_url/celestia-data-${pkgver}~${_version_celestia_data}-any.${_archive_extension}"
	"$_download_url/celestia-textures-hires-${pkgver}~${_version_celestia_data}-any.${_archive_extension}"
	"$_download_url/celestia-textures-lores-${pkgver}~${_version_celestia_data}-any.${_archive_extension}"
	"$_download_url/celestia-textures-medres-${pkgver}~${_version_celestia_data}-any.${_archive_extension}"
)
source_x86_64=(
	"$_download_url/celestia-${pkgver}~${_version_celestia_app}-${arch[0]}.${_archive_extension}"
	"$_download_url/libcelestia-${pkgver}~${_version_celestia_app}-${arch[0]}.${_archive_extension}"
	"$_download_url/celestia-${_celestia_ui}-${pkgver}~${_version_celestia_app}-${arch[0]}.${_archive_extension}"

	"$_download_url/cspice-${_version_cspice}-${arch[0]}.${_archive_extension}"
)
sha256sums=('641798f5720e7a9164978105cdabf109f40f0711a60cef1b944a2f0a56a1728c'
            '861ac7a3171e25b72f8d82b450783f920176994a916d456b22a3b64f26e7676e'
            '86a9a28ee035e248bba82c44988e62d0d12d91c9033323f9161afd7a6d09a0e1'
            'b60e1be6ebea01bf914fb4d3f8a392c256509d038a22c90abbd264d94e86b8a5')
sha256sums_x86_64=('71ff539019499e26b9bcb8388254b1fb861f5b3d179764b469b87f395771b201'
                   'fcdb495b4907d8d2e50f3ff98e6f3cf59f646ea093c8bf051f923ade0eb97f2c'
                   '5f447140b036a7c9193585900c53f009f313b5dcadc0ae1938f4476626b379c8'
                   'e3eb5183d0d37f169567f3f7e1a2b1c8a2c5d31d1878bfc9eb356420345c0eaa')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
