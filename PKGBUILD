# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=SC2034,SC3030
pkgname=alchemy-next-viewer-bin
pkgver=6.4.23.1220
_projectname="AgileAkita"
pkgrel=1
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
conflicts=('alchemy-next-viewer' 'alchemy-viewer')
provides=('alchemy-next')
pkgfolder="Alchemy_Project_${_projectname}_""$(echo "${pkgver}" | tr '.' '_')""_x86_64"
source=('https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/Alchemy_Project_'"${_projectname}/${pkgver}/${pkgfolder}"'.tar.bz2' 'alchemy-next.desktop')
sha1sums=('b096624adab1c99cb2ad95572ab186f7c768eb19'
          'ceda56749a643b5baa17a236dfb89f76b8350f78')
b2sums=('02aaab99adc8c492cca95b410632e3a5d0c6e6cd4a6d3308ad4f40f14249753592e666f1a0825ec982df0420c1c5f8ad50457e9e2af62048f04dcf82e39d58ff'
        '152ed008f85eb748528e74d07fcce577f3d6e7ebf4e1224242c10af9be420d9513db4ad0b252600ebac26949f69d73809554fe6a6d1bf2841af28e0da65ffc91')
pkgver() {
	echo "${pkgver}"
}
package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${pkgfolder}" "$pkgdir/opt/$pkgname"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/share/applications/alchemy-next.desktop"
  sed -i 's/Name=Alchemy/Name=Alchemy Project '"${_projectname}"'/' "${pkgdir}/usr/share/applications/alchemy-next.desktop"
}
