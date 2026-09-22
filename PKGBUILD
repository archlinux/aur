# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=29
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

_version_cspice="67-6.2"
_version_celestia_app="git20260919+7d2c2cd-1.1"
_version_celestia_data="git20260920+eab9393-1.1"

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
sha256sums=('ac619c81b1b12b83e75769ed80fe8d1bdc04075d48fb2f6670bee4275a95df81'
            '898e21d0e18dda26e41a11b4eb351372e75d119a3ef99fad478baceab79ffa74'
            '64ae91c47209dffe52e7b7abed8db744377f4246b9263314593ec3dc0cedf9a0'
            '437acbf46ccd82f5011c66f9db625c11d16b345e12a834e0d457152e0e759e38')
sha256sums_x86_64=('a3ab1d50785189555fa5eab3d6af6f741c84a64c1ab78ee8126dd32d463fd638'
                   '6f225e313d30938544632fcc571ef62a62085e2a265b951bb05bc15e1383bec2'
                   'a2d67a4d7bc21da74d72e7522c6fffba92e5191541b82052c3caa61cf4d95021'
                   '147bc3e7df8a54d837a124290b2f7200b6562a82b03e7eec751a2d448c4c481c')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
