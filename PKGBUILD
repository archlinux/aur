# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=31
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

_version_cspice="67-7.1"
_version_celestia_app="git20260929+46024cd-1.1"
_version_celestia_data="git20260923+3ed5836-1.1"

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
sha256sums=('319287c4e521173eb40368763adeec2d535fd78b3bec54cd3e97e8569138a69e'
            'e55a60bdfacfbc7bdb52989af2284ba4fc4de47c93e533c93a8191dcc35bc2b8'
            '86e50099c33f8ca06242b2f15f5cfbaeb5b8da60e0cbcd9161a9e943a6ce065e'
            '5104552ac336cbd1d2a4c1b537dcd11f35baf3bc67f647f4c70427b858166a2b')
sha256sums_x86_64=('b38572f5421b97ec5daaa563d4881d3c358f9066bdb168a690dfbe595d2c999d'
                   'e213fa4d336481311de53a51e2e0cf26660bec970cdc7940b99aaf5bd04bd1b0'
                   '76385073d484af2e5780626e82a1db34da03a6894739743a601ed213dc624629'
                   '7bde59f5917ab3382ebd1b3408c565d5ed49f691b5cb0f84d55148d014b464fb')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
