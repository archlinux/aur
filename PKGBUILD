# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.5.1.1332
pkgrel=1
_releasename="Project AgileAkita"
_pkgfolder="Alchemy_${_releasename// /_}_${pkgver//\./_}_x86_64"
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
		# Alternative download link when direct link is not provided
        # "ci-build-935.tar.bz2"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/935/download'
        "Alchemy_${_pkgfolder}.tar.bz2"::'https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/Alchemy_Project_AgileAkita/6.5.1.1332/Alchemy_Project_AgileAkita_6_5_1_1332_x86_64.tar.bz2'
        'alchemy-next.desktop')
sha1sums=('a92202dd1e64f4612b4eeb370e39affa4ae53ed5'
          '8468775b4863b9a4d5c7c0f7d0319a54b97636de')
b2sums=('c0ab145603b6cbd7e6e837f6d91d8927e17f5d27d53fd416ed9ea2136ba23c95c94fc268ba40b2819c3d8115d0de055476d9c867ac0cf969a67ef8ef4873a06d'
        'fbab51351cd1c427563fdaf8ffd35d1ca2aef3f4eaea03644cc35cd2063b0b3ea29fd96ca9cc774f21d6172584c195a79aafab4b37aa1108c9e47abef013f709')
pkgver() {
  echo "${pkgver}"
}
package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${_pkgfolder}" "$pkgdir/opt/$pkgname"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
  sed -i 's/Name=Alchemy/Name=Alchemy '"${_releasename}"'/' "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
}
