# Author: Xenhat Hex (me@xenh.at)
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.5.3.1452
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
sha1sums=('9fa873e32b8238998b590edefc9b97c6bb18c3d5')
b2sums=('284c1afebdbf178bfb5e65cfc43921f7f87a2234cc8ad3f746d21d098dbb3a08c0c190e7c56e5809d68b1ad5f4b275099953a1b693314ccd006e1738d2ce2b45')
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
