# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">

pkgname=adom-noteye
pkgver=1.2.0_pre59
pkgrel=1
pkgdesc="roguelike game with a quest-centric, plot driven structure"
arch=('i686' 'x86_64')
conflicts=('adom' 'adom-restricted')
provides=('adom')
depends=('ncurses' 'mesa' 'lua51' 'libtinfo' 'libcaca' 'libmad' 'fluidsynth'
        'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'zlib') # 'libpng12' (adom sdl2 link against it)
url="http://www.adom.de/"
license=('custom: "adom"')
source=(LICENSE
        adom.sh)
source_i686+=(http://media1.gamefront.com/moddb/2015/07/20/adom_noteye_linux_ubuntu_32_r59_pub.tar.gz)
source_x86_64+=(http://media1.gamefront.com/moddb/2015/07/20/adom_noteye_linux_ubuntu_64_r59_pub.tar.gz)
sha1sums=('51d28fe3f0420cd354113fd7ceb2a1a7abf1b069'
          'c99d3f55f59b2ee51e327b6d9e58fefd1e051ff2')
sha1sums_i686=('ce3bb56bafa0e90b08d209c37543710f6cde9244')
sha1sums_x86_64=('3caf871e9ce1a3e33d240829de626ec670e0bd3a')


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
  cp -R "${srcdir}/adom" "${pkgdir}/opt/"

  # Since the adom binary uses a relative RPATH, it's either
  # this or patching the binary
  install -Dm755 "${srcdir}/adom.sh" "${pkgdir}/usr/bin/adom"
  install -m644 -D ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/adom/LICENSE
}
