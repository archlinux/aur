# Author: Xenhat Hex (me@xenh.at)
# Maintainer: Xenhat Hex (me@xenh.at)

# shellcheck disable=SC2034,SC3030
pkgname=alchemy-next-viewer-bin
pkgver=6.4.23.1264
_projectname="AgileAkita"
_pkgfolder="Alchemy_Project_${_projectname}_""$(echo "${pkgver}" | tr '.' '_')""_x86_64"
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
provides=('alchemy-next')
#source=("alchemy-next-ci"::'https://git.alchemyviewer.org/api/v4/projects/78/packages/generic/Alchemy_Project_'"${_projectname}/${pkgver}/${_pkgfolder}"'.tar.bz2' 'alchemy-next.desktop')
source=(
        "alchemy-next-ci"::'https://git.alchemyviewer.org/alchemy/alchemy-next/-/package_files/914/download'
        'alchemy-next.desktop')
sha1sums=('340d20d7dc877050aeb68708db8e88d5bc8cbe9b'
          'ceda56749a643b5baa17a236dfb89f76b8350f78')
b2sums=('2409e97dfed623d7bbc0d788f13be1d4f3be8909ff0aedde52930b22a03380d71d491a575ef07ce895fbfe4eda95759dc63cd356353d860ae534e1dd8a04c566'
        '152ed008f85eb748528e74d07fcce577f3d6e7ebf4e1224242c10af9be420d9513db4ad0b252600ebac26949f69d73809554fe6a6d1bf2841af28e0da65ffc91')
pkgver() {
  echo "${pkgver}"
}
package() {
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/opt
  mv "${srcdir}/${_pkgfolder}" "$pkgdir/opt/$pkgname"
  install -Dm644 "alchemy-next.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i 's/Name=Alchemy/Name=Alchemy Project '"${_projectname}"'/' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
