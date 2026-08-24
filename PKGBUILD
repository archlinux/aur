# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=24
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
_version_celestia_app="git20260822+0bee6cc-1.1"
_version_celestia_data="git20260821+94ae767-1.1"

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
sha256sums=('c0f7cb1c2174d3ce5f99ab929acb6d147f2ae5f7f0fd2ea48e10f39932f0c4f5'
            '5ad01467803f56ab6129bf3556646961443ad8b960c987726803c81aac6879e6'
            '04e374ac94f2c9d9cf30d1861390c94bdb7e957bb71af74e7a71cae4d4e14911'
            '11b1524c157390190255e9ba13e3bd614c8d322d7b699ee6e38cd5a5d960899e')
sha256sums_x86_64=('f8fc7020bab5bcf8b76221773bbd0c9719618ab751bbc32669e56f92b0b2c92c'
                   '999e3f16badcaf7ee61a8dc9df53418b3dc8e49815864027cbffc71d068d2d07'
                   '8fd39b757a5fc2f08b50024b365504f1cf9ca54ff15c32c26cb57608c0e5337b'
                   '81799e9355a50ad9915fe5eb54f72c2ff45caa29becc805c2dc006bb98024168')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
