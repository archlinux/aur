# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Eugene Yunak <val-amart at mail dot ru>
# Contributor: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">

pkgname=adom-noteye
pkgver=1.15.2
_release=r60
_date=2015/08/23
pkgrel=2
pkgdesc="roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64')
depends=('mesa' 'lua51' 'libtinfo-5' 'libcaca' 'libmad' 'fluidsynth'
        'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'zlib') # 'libpng12' (adom sdl2 link against it)
url="http://www.adom.de/home/index.html"
license=('custom: "adom"')
source=(LICENSE
        adom-noteye.sh)
source_i686+=(http://ams2.dl.dbolical.com/${_date}/adom_noteye_linux_ubuntu_32_${_release}_pub.tar.gz)
source_x86_64+=(http://ams2.dl.dbolical.com/${_date}/adom_noteye_linux_ubuntu_64_${_release}_pub.tar.gz)
sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069'
          'd1d1a279e6d4d296f09519381674b5ea99007599')
sha1sums_i686=('72febc188d80daa01b3a34fa2d6449b4c45826f9')
sha1sums_x86_64=('ff7e022afa7c0ba364fc697e240c7236604235b5')


prepare() {
  cd "adom/lib/"

  # Remove some bundled libs for which we have perfectly good versions available
  rm -f "libFLAC.so.8"
  rm -f "libjpeg.so.8"
  rm -f "liblua5.1.so.0"
  ln -s ../../../usr/lib/liblua5.1.so liblua5.1.so.0
  #rm -f "libmikmod.so.2"
  # libnoteye.so we keep at this point
  rm -f "libogg.so.0"
  rm -f "libSDL2-2.0.so.0"
  rm -f "libSDL2_image-2.0.so.0"
  rm -f "libSDL2_mixer-2.0.so.0"
  rm -f "libSDL2_net-2.0.so.0"
  rm -f "libSDL2_ttf-2.0.so.0"
  #rm -f "libtiff.so.4"
  rm -f "libvorbisfile.so.3"
  rm -f "libvorbis.so.0"
  rm -f "libz.so.1"
}

package() {
  # Copy entire contents of the archive to /opt
  install -d "${pkgdir}/opt"
  cp -R "${srcdir}/adom" "${pkgdir}/opt/adom-noteye"

  # Since the adom binary uses a relative RPATH, it's either
  # this or patching the binary
  install -Dm755 "${srcdir}/adom-noteye.sh" "${pkgdir}/usr/bin/adom-noteye"
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom-noteye/LICENSE
}
