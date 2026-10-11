# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=celestia
pkgname=${_pkgname}-bin
pkgver=1.7.0
pkgrel=33
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
_version_celestia_app="git20261004+9ed934b-2.1"
_version_celestia_data="git20261010+60316cf-1.1"

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
sha256sums=('99e1d4000695c00873f32e82d8bc5b50a7edeecb167b9801709e426ac0537b13'
            '71bdd1c4bd7cd554746bd115a37dc06d0eb8cf304323e97841ef80f9d754ad66'
            '27970670da4a8aba6ec1608f91b38b110a3e26211127d17efcfb5f2a46c2c594'
            '95957fd52fa1d4b8f46a1971d7301cf5ba3b8a4aec3cfb4c263a6087c471288b')
sha256sums_x86_64=('75e14456b1b2781a72eb179a3e0ca4bd91aaa44d1335481d621cd2883710608e'
                   '3b2e7f0f47339b1b077ce02a4ca1dce14cb1bde9c69f08414c94f9a07dedfe9f'
                   'dcffa8c96a7cf0db3cec818b8713316ed67c7a19eedd251750d96a3c3e0b09c3'
                   '7bde59f5917ab3382ebd1b3408c565d5ed49f691b5cb0f84d55148d014b464fb')


prepare() {
	sed -i -e 's/Celestia \(.*\)/Celestia/g' -e 's/Space Simulator \(.*\)/Space Simulator/g' "${srcdir}/usr/share/applications/space.celestiaproject.celestia_qt6.desktop"
}

package() {
	cp -ra "${srcdir}/usr" "${pkgdir}/"
	cp -ra "${srcdir}/etc" "${pkgdir}/"

	ln -sf "/usr/bin/${_pkgname}-${_celestia_ui}" "${pkgdir}/usr/bin/${_pkgname}"
}
