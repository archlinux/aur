# Maintainer: LinRuoshui <lin.ruohshoei@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Jacob Emmert-Aronson <jacob at mlaronson dot com>
# Contributor: Rene Schoebel <schoebel.r at gmail dot com>
# Contributor: ZekeSulastin <zekesulastin@gmail.com>
# Contributor: Mr_Robotic_Evil <mr.robotic.evil@googlemail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

# This PKGBUILD only generates the engine binary.
# The retail Freespace 2 data is required to play the
# original game and most mods.  You can use a non-AUR/pacman'd
# copy, but you'll be on your own as far as running the game
# and mods are concerned.
# Check the AUR package 'fs2_open-data' for details.

pkgname=fs2_open
_pkgname=fs2open
pkgver=3.8.0
_pkgver=3_8_0 # Upstream's url/dirs
pkgrel=1
pkgdesc="An enhancement of the FreeSpace 2 engine"
url="http://scp.indiegames.us"
arch=('i686' 'x86_64')
license=('custom:fs2_open')
conflicts=('fs2_open-git')
depends=('doxygen' 'libjpeg' 'libpng' 'libtheora' 'libvorbis' 
	 'lua51' 'mesa' 'openal' 'sdl' 'glu' 'jansson')
optdepends=('fs2_open-mediavps: extensive audiovisual enhancements'
	    'fs2_open-data: extensive retail data'
	    'wxlauncher: cross-platform fs2 launcher')
install=$pkgname.install
source=("https://github.com/scp-fs2open/fs2open.github.com/releases/download/release_${_pkgver}/${pkgname}_${_pkgver}-source-Unix.tar.gz"
        'fs2_open'
        'fs2_open.desktop'
        'options')
sha256sums=('d26ff8b666bdae1e9f42abaf2f498db361093f2289da78555f1f6fbba7562227'
            'ba7f8c62c41259223186b400ddcbb2c80665d27c6c34e0a5eca50b79450d2214'
            'cac8914fb96eb4f09d8dec0005ccb3626499ab9f3f4c5f64c11bd8d2e913e372'
            'c593dacd19705f1aaf23170d7b65b4621945200d3a496e256f77e3f1f0279741')
build() {
  cd "${_pkgname}.github.com"

  mkdir build
  cd build
  cmake ../
  make
}

package() {
  cd "${_pkgname}.github.com"
  binary=`find build/bin/fs2_open*`	
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 ../fs2_open.desktop "$pkgdir/usr/share/applications/fs2_open.desktop"
  install -D -m644 ../options "$pkgdir/usr/share/$pkgname/options"
  install -D -m755 ${binary} "$pkgdir/opt/$pkgname/fs2_open_$pkgver"
  install -D -m755 "../fs2_open" "$pkgdir/usr/bin/fs2_open"
}
