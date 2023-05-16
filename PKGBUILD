# Author: Xenhat Hex (me@xenh.at)
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.10.1880
pkgrel=1
_ci_build_id=1808
_releasename="Alchemy Project DynamicDingo"
_releasename_underscored="${_releasename// /_}"
_version_underscored="${pkgver//\./_}"
_pkgfolder="${_releasename_underscored}_${pkgver//\./_}_x86_64"
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
# source=("${_pkgfolder}.tar.bz2"::'https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/'"${_releasename_underscored}/${pkgver}/${_pkgfolder}.tar.bz2")
source=("${_pkgfolder}.tar.bz2"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/'"${_ci_build_id}"'/download')
sha1sums=('95e7064d5e059d752d95364b6496de074a26d4ca')
b2sums=('0c79def124d260b11b79a3056f04d757845408012f647342929210234f3e1112754b9a396825f1afe253ff48c997ba572302c9c334ae65d74cff188917be5898')
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
