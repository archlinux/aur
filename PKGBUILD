# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=25
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

_version_cspice="67-6.1"
_version_celestia_app="git20260830+64daaa4-1.1"
_version_celestia_data="git20260821+94ae767-1.2"

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
sha256sums=('53df16bccb39478e4627af827f04aaf2fe84a5816ab0dd751b54e7f42a1e2db4'
            '7d898c6bcc8b0b87b8abbcffa31c2c1c5a8e17a1700d35e07fb7457cfba21ae6'
            '673b555f7ca0a9d883fb61f450d90452b68981ee304513d428e528b5c788469d'
            'efb3516c0a6ec02d0c57fc2c3068e6c2c75c903032f62761015cfaa6f1e17906')
sha256sums_x86_64=('79575099fb2633eea9be72b9318998327db53c0c2a513e881ae0f7f3c87d5198'
                   'dafcb742be2653ffa7004c08b49c10888a7abf07c1e1d685ab80876e260222a4'
                   '3fd3e0bca3b0885d4775306dea847f26c5bede3351508133c071320f3a2e5653'
                   '301906f9ddd5151042658e247eeae49a48a3375e47e353b5be66c86bc9211dc7')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
