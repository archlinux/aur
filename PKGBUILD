# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=2034,3030,2154
pkgname=alchemy-next-viewer-bin
pkgver=6.5.1.1275
pkgrel=3
_releasename="Project AgileAkita"
_pkgfolder="Alchemy_${_releasename// /_}_${pkgver//\./_}_x86_64"
pkgdesc="Next generation of the Alchemy Viewer, an open-source Second Life client - Official CI Project build"
arch=('x86_64')
url=https://www.alchemyviewer.org
license=('LGPL')
depends=(dbus-glib glu gtk3 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl2 vlc zlib)
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
        "ci-build-935.tar.bz2"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/935/download'
        'alchemy-next.desktop')
sha1sums=('1ef1d35773fd91e5cf16419a303b4d6986fabbcd'
          '8468775b4863b9a4d5c7c0f7d0319a54b97636de')
b2sums=('47b884af32fae38896f722df7dcd003c487748819827f8ebbd79ba911a8e1ecf60d1c8e7ad727b5a67dc3b05125287511e401dd57f18ee35534edcf66e799b36'
        'fbab51351cd1c427563fdaf8ffd35d1ca2aef3f4eaea03644cc35cd2063b0b3ea29fd96ca9cc774f21d6172584c195a79aafab4b37aa1108c9e47abef013f709')
pkgver() {
  echo "${pkgver}"
}
strip() {
  # package is already pre-stripped when desired
  true
}
package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${_pkgfolder}/" "$pkgdir/opt/$pkgname/"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
  sed -i 's/Name=Alchemy/Name=Alchemy '"${_releasename}"'/' "${pkgdir}/usr/local/share/applications/${pkgname}.desktop"
}
