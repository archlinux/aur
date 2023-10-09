# Author: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Rye Mutt
# Maintainer: Xenhat Hex (me@xenh.at)
# shellcheck disable=2034,3030,2154
pkgname=alchemy-viewer
pkgdesc="A Second Life client with focus on performance and code correctness."
pkgver=7.0.0.2170
pkgrel=4
epoch=1696809895
_project_id=200
_releasename="Alchemy Project PBR"
_releasename_underscored="${_releasename// /_}"
_version_underscored="${pkgver//\./_}"
_pkg_arch="x86_64"
_pkgfolder="${_releasename_underscored}_${pkgver//\./_}_${_pkg_arch}"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
options=(!strip)
install=alchemy.install
depends=(glu libgl libiconv libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc xdg-desktop-portal zlib)
makedepends=('sed' 'xz')
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
provides=('alchemy-viewer' 'alchemy-next-viewer-bin')
replaces=('alchemy-next-viewer-bin')
source=('https://git.alchemyviewer.org/api/v4/projects/'"${_project_id}"'/packages/generic/'"${_releasename_underscored}/${pkgver}/${_pkgfolder}.tar.xz")
sha256sums=('505a493b6668bef7b9200acb74903109e2cb3b4689f2d492b29a65c3f6cb2641')
package() {
	mkdir -p "${pkgdir}"/opt
	# Patch shortcut to avoid duplicated entries
	sed -i 's;Name=Alchemy;Name='"${_releasename}"';' "${srcdir}/${_pkgfolder}/etc/refresh_desktop_app_entry.sh"
	sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${srcdir}/${_pkgfolder}/etc/refresh_desktop_app_entry.sh"
	mv "${srcdir}/${_pkgfolder}" "${pkgdir}/opt/${pkgname}"
}
