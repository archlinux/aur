#!/bin/bash
## Author: Xenhat Hex (me@xenh.at)
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.11.1989
pkgrel=2
_ci_build_id=1808
_releasename="Alchemy Project DynamicDingo"
_releasename_underscored="${_releasename// /_}"
_version_underscored="${pkgver//\./_}"
_pkg_arch="x86_64"
_pkgfolder="${_releasename_underscored}_${pkgver//\./_}_${_pkg_arch}"
pkgdesc="This is the next generation of Alchemy Viewer! - Binary Project build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
options=(!strip)
install=alchemy.install
# depends=(dbus-glib glu gtk3 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
depends=(dbus-glib glu gtk3 libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
makedepends=(sed)
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
source=('https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/'"${_releasename_underscored}/${pkgver}/${_pkgfolder}.tar.xz")
# source=("${_pkgfolder}.tar.bz2"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/'"${_ci_build_id}"'/download')
sha1sums=('dca7af7bd7cff9a8d2da4c12f74c3d8751281105')
b2sums=('553cb26a0ad0df35edbcff7e696241e31776422088e07c09d00ecb8ecf2bcc55188b5118e3b4350806a311b7f4ed709b39fcae83b64828d2fb560b5bf50f58f9')
# pkgver() {
# echo "${pkgver}"
# }
package() {
    mkdir -p "${pkgdir}"/opt
    # Patch shortcut to avoid duplicated entries
    sed -i 's;Name=Alchemy;Name='"${_releasename}"';' "${srcdir}/${_pkgfolder}/etc/refresh_desktop_app_entry.sh"
    sed -i 's;alchemy-viewer\.desktop;'"${pkgname}\.desktop"';' "${srcdir}/${_pkgfolder}/etc/refresh_desktop_app_entry.sh"
    mv "${srcdir}/${_pkgfolder}" "${pkgdir}/opt/${pkgname}"
}
