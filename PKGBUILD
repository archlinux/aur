# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.5.2.1342
pkgrel=1
_releasename="Alchemy Project AgileAkita"
_releasename_underscored="${_releasename// /_}"
_version_underscored="${pkgver//\./_}"
_pkgfolder="${_releasename_underscored}_${pkgver//\./_}_x86_64"
pkgdesc="Next generation of the Alchemy Viewer, an open-source Second Life client - Official CI Project build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
options=(!strip)
# depends=(dbus-glib glu gtk3 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
depends=(dbus-glib glu gtk3 libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
optdepends=(
  'alsa-lib: ALSA support'
  'freealut: OpenAL support'
  'gamemode: Gamemode support'
  'lib32-libidn11: SLVoice support'
  'libpulse: PulseAudio support'
  'mesa-libgl: Intel, Radeon, Nouveau support'
  'nvidia-libgl: NVIDIA support'
  'nvidia-utils: NVIDIA support')
provides=('alchemy-next')
source=(
        "${_pkgfolder}.tar.bz2"::'https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/'"${_releasename_underscored}/${pkgver}/${_pkgfolder}.tar.bz2"
        'alchemy-next.desktop')
sha1sums=('3479198ce34e8d6a52f88a8627e6ab16bc72fa81'
          '8468775b4863b9a4d5c7c0f7d0319a54b97636de')
b2sums=('c78acbfb5015a4d36e4169f8624fd8711eda0d93f0fe89e37ea570633ae00d328208380a176b499ac3bcf547bd470190f7479eb31225b62f3e858e65551f8256'
        'fbab51351cd1c427563fdaf8ffd35d1ca2aef3f4eaea03644cc35cd2063b0b3ea29fd96ca9cc774f21d6172584c195a79aafab4b37aa1108c9e47abef013f709')
pkgver() {
  echo "${pkgver}"
}
package() {
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${_pkgfolder}" "$pkgdir/opt/$pkgname"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
  sed -i 's/Name=Alchemy/Name='"${_releasename}"'/' "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
}
