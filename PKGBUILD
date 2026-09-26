# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=30
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
_version_celestia_app="git20260926+57a862d-1.1"
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
sha256sums_x86_64=('f27b7c26c890919323e0b6c0b9b9bee1fd069e1fb020ee89f8ecea22f329de9b'
                   '68c6c4a25c96971645866c8742c7a5817fe93dc8d6835b5c86fb48ce0d07e175'
                   '3fadcf5197edec28a9aa62b5adee59df9f992bc4477eeb56daf71e6ce6980067'
                   '7bde59f5917ab3382ebd1b3408c565d5ed49f691b5cb0f84d55148d014b464fb')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
