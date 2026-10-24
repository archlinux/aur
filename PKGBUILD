# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=37
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
_version_celestia_app="git20261024+76e5624-1.1"
_version_celestia_data="git20261021+e6d0541-1.1"

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
sha256sums=('c4366c61d7cec599ffc3a1077e48706d11c66b8a5778a4c3c242a34418d86d7d'
            '0f0ef96d3e25eb86296c9c8007bcd0c7007040aecdd49597aa2e40f868eda491'
            '8140a4114e22d970c6df2e5cd672d4cd96c711337db8cc2c64cd8387ba1d82fb'
            '84e07ed9dce6292a44bd2c57843053be9987033b68a233fb5b6323d9c159432e')
sha256sums_x86_64=('57ddee3dbe88210b7f1860f139268beb82b644f6079b0143938a4122836c0ae2'
                   'a6d8b12929b1cdf1946c1dffaf288f42721c3caf5dc724d9366f5eb189fe59df'
                   '22a35fc2d4c93a344a2e5e784104932d9e061411334cd9afdd800bf4e6cba76b'
                   'e3eb5183d0d37f169567f3f7e1a2b1c8a2c5d31d1878bfc9eb356420345c0eaa')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
