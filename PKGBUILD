#!/bin/bash
## Author: Xenhat Hex (me@xenh.at)
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=7.1.1.2256
pkgrel=1
_project_id=78
_releasename="Alchemy Beta"
_releasename_underscored="${_releasename// /_}"
_version_underscored="${pkgver//\./_}"
_pkg_arch="x86_64"
_pkgfolder="${_releasename_underscored}_${pkgver//\./_}_${_pkg_arch}"
pkgdesc="A Second Life client with focus on performance and code correctness. - Binary Project build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
options=(!strip)
install=alchemy.install
depends=(glu libgl libiconv libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc xdg-desktop-portal zlib)
makedepends=('sed')
optdepends=(
	'alsa-lib: ALSA support'
	'freealut: OpenAL support'
	'gamemode: Gamemode support'
	'lib32-libidn11: SLVoice support'
	'lib32-libsndfile: SLVoice support'
	'lib32-util-linux: SLVoice support'
	'lib32-gstreamer0.10: SLVoice support'
	'libpulse: PulseAudio support'
	'mesa-libgl: Intel, Radeon, Nouveau support'
	'nvidia-libgl: NVIDIA support'
	'nvidia-utils: NVIDIA support'
	'wine: More up-to-date, less buggy SLVoice support')
provides=('alchemy-viewer')
# The release url format changes often, please keep this comment for easy switching.
source=('https://git.alchemyviewer.org/api/v4/projects/'"${_project_id}"'/packages/generic/'"${_releasename_underscored}/${pkgver}/${_pkgfolder}.tar.xz")
sha256sums=('584b0ee46b1f21b23f17b10e64f01b6f17b49bb8b8ad3b89820b6288c2169e54')
package() {
	mkdir -p "${pkgdir}"/opt
	# Patch shortcut to avoid duplicated entries
	sed -i 's;Name=Alchemy;Name='"${_releasename}"';' "${srcdir}/${_pkgfolder}/etc/refresh_desktop_app_entry.sh"
	sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${srcdir}/${_pkgfolder}/etc/refresh_desktop_app_entry.sh"
	mv "${srcdir}/${_pkgfolder}" "${pkgdir}/opt/${pkgname}"
}
