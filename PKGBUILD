# Author: Xenhat Hex (me@xenh.at)
# Maintainers: Xenhat Hex (me@xenh.at), Justin Jagieniak <justin@jagieniak.net>

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.5.2.1342
pkgrel=3
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
sha1sums=('3479198ce34e8d6a52f88a8627e6ab16bc72fa81')
b2sums=('c78acbfb5015a4d36e4169f8624fd8711eda0d93f0fe89e37ea570633ae00d328208380a176b499ac3bcf547bd470190f7479eb31225b62f3e858e65551f8256')
# pkgver() {
  # echo "${pkgver}"
# }
package() {
  mkdir -p "${pkgdir}"/opt
  # Patch shortcut to avoid duplicated entries
  sed -i 's;Name=Alchemy;Name='"${_releasename}"';' "${pkgdir}/opt/${pkgname}/etc/refresh_desktop_app_entry.sh"
  sed -i 's;alchemy-viewer\.desktop;'"${pkgname}"';' "${pkgdir}/opt/${pkgname}/etc/refresh_desktop_app_entry.sh"
  mv "${srcdir}/${_pkgfolder}" "${pkgdir}/opt/${pkgname}"
}
