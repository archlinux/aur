# Maintainer: Eric Anderson <ejona86 at gmail dot com>
# Contributor: jimmy-6 <jakub.jarozek {at} gmail.com>

pkgname=shadowgrounds
pkgver=beta12_update1
pkgrel=3
pkgdesc='A 3D sci-fi alien shooter (game sold separately)'
arch=('i686' 'x86_64')
url='http://shadowgroundsgame.com/'
license=('unknown')
if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-libglade' 'lib32-mesa' 'lib32-openal' 'lib32-libvorbis'
           'lib32-sdl_ttf' 'lib32-libxmu' 'lib32-sdl_sound' 'lib32-sdl_image')
  optdepends=('lib32-libtxc_dxtn: texture decoding for open source ATI and Intel drivers')
else
  depends=('libglade' 'mesa' 'openal' 'libvorbis' 'sdl_ttf' 'libxmu' 'sdl_sound'
           'sdl_image')
  optdepends=('libtxc_dxtn: texture decoding for open source ATI and Intel drivers')
fi
options=('!strip')
makedepends=('unzip')
if [ "$CARCH" = "x86_64" ]; then
  install="${pkgname}.install"
fi
_gamepkg="shadowgroundsUpdate1.run"
source=("${pkgname}-launcher.sh" "${pkgname}.desktop" "hib://${_gamepkg}")
noextract=("${_gamepkg}")
md5sums=('c83e117078496deac700c271694533ea'
         '5bf18b1fff2e96b4a1d70b563c4f2ce7'
         '7c9913f754168742973edfeb66ba8f1c')
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download the file manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf"; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

build() {
  cd "${srcdir}"
  unzip -o "${_gamepkg}" -d "${pkgname}-${pkgver}" || true
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Copy game files
  mkdir -p "${pkgdir}/opt/"
  cp -rl . "${pkgdir}/opt/${pkgname}"

  # Remove unnecessary files
  rm "${pkgdir}/opt/${pkgname}/createShortcuts.sh"
  rm "${pkgdir}/opt/${pkgname}/removeShortcuts.sh"

  # Use system-provided libraries
  rm "${pkgdir}/opt/${pkgname}/lib32/libasound_module_pcm_pulse.so"
  rm "${pkgdir}/opt/${pkgname}/lib32/libasound.so.2"
  rm "${pkgdir}/opt/${pkgname}/lib32/libexpat.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libFLAC.so.8"
  rm "${pkgdir}/opt/${pkgname}/lib32/libgcc_s.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libgmodule-2.0.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libgomp.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libICE.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libjpeg.so.62"
  rm "${pkgdir}/opt/${pkgname}/lib32/libmikmod.so.2"
  rm "${pkgdir}/opt/${pkgname}/lib32/libm.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libogg.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libopenal.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libpng12.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/librt.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libSDL-1.2.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libSDL_image-1.2.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libSDL_sound-1.0.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libSDL_ttf-2.0.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libsmpeg-0.4.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libSM.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libspeex.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libstdc++.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libtiff.so.4"
  rm "${pkgdir}/opt/${pkgname}/lib32/libvorbisfile.so.3"
  rm "${pkgdir}/opt/${pkgname}/lib32/libvorbis.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libX11.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXau.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libxcb-render.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libxcb-render-util.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libxcb.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libxcb-xlib.so.0"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXcomposite.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXcursor.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXdamage.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXdmcp.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXext.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXfixes.so.3"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXinerama.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXi.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libxml2.so.2"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXmu.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXrender.so.1"
  rm "${pkgdir}/opt/${pkgname}/lib32/libXt.so.6"
  rm "${pkgdir}/opt/${pkgname}/lib32/libz.so.1"

  # Fix permissions
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
  chmod -R 755 "${pkgdir}/opt/${pkgname}/lib32"
  chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}-bin"
  chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}-launcher"

  # Copy launchers
  install -Dm755 "${srcdir}/${pkgname}-launcher.sh" \
      "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
