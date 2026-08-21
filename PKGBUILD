# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=23
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

_version_cspice="67-5.1"
_version_celestia_app="git20260819+8b23eb6-1.1"
_version_celestia_data="git20260817+72d16fc-1.1"

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
sha256sums=('7b2381a25b592bba86ce631b23b0a8b43f05791ea7a90d528ab0021e1ee230aa'
            '1ac0c9264ddc5e32a10f02f73e1a843f878612a27a8a7c96c99e3ffa41a1a60e'
            '786d2397aeb21978704be7b98ed8d05c17e8a1002bcf9817ed3582fdde36fba6'
            '66629d6f36ffd9b7be6d59d23cfaf82b01cfbc22aa05357232c5da379486ce0f')
sha256sums_x86_64=('25d9d1a5a3d1bca78155912218adfbaa6512ee4ecf25d984f717926cb9bdbc02'
                   '237e76f41709caf35d63aa9a8e1a6344239f70f82a3690b44eded5d7d0e8499a'
                   'f0e5e726d5935fe5a3d9dce555e63360a013e142d788fb074f21cee41b813993'
                   '81799e9355a50ad9915fe5eb54f72c2ff45caa29becc805c2dc006bb98024168')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
