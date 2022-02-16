# Author: Xenhat Hex (me@xenh.at)
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.5.3.1454
pkgrel=1
_releasename="Alchemy Project AgileAkita"
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
  'libpulse: PulseAudio support'
  'mesa-libgl: Intel, Radeon, Nouveau support'
  'nvidia-libgl: NVIDIA support'
  'nvidia-utils: NVIDIA support')
provides=('alchemy-viewer')
source=("${_pkgfolder}.tar.bz2"::'https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/'"${_releasename_underscored}/${pkgver}/${_pkgfolder}.tar.bz2")
sha1sums=('791e755a5dad859b7a9b1f125284d38e0f729e21')
b2sums=('dcec836077c3cc17bcb82f7a89508d0e29bd8dbcfb2d907598dc3d9febaba36ea2773c3b4b82848f086fa78f07c4e68d6090ec351c15c5ab19420b19ef7e80a7')
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
