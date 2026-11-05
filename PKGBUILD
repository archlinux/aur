# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=39
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
_version_celestia_app="git20261103+656b7de-1.1"
_version_celestia_data="git20261102+d6bb1f4-1.1"

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
sha256sums=('63bdf3287d812c002d79f58c49c714f42a2db18f2e03c6fa03a33e303c21aae9'
            '054549001ee6ba8734253fdc4d1a729d9ef7a120dbee21b09de3d266a512300c'
            'c32c9c349fc478b550e0654c33f6a9961ec2a92b5bbc3e99453bbab766e35662'
            'f50f5de7517252b5e63ed7f54685214d1814c032b41f8f07cf3631bc2fcaf455')
sha256sums_x86_64=('d0139dd34297ce8aa82d7f9a800d641b4fe42eca92336b6d374a7601c4bc0eef'
                   '7b5fdf6248a2cf1ed3ad8ce29c4d503cd5696a9905bdf563954fc36d9e507732'
                   'e1f39492d7ad74390a4c63130c62fb8c8b615bf031e8a68c7768d6b7153d9df9'
                   'e3eb5183d0d37f169567f3f7e1a2b1c8a2c5d31d1878bfc9eb356420345c0eaa')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
