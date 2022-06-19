# Maintainer: Roboron <robertoms258 at gmail dot com>

pkgname=simutrans-svn
pkgver=r10665
pkgrel=1
pkgdesc="Transportation simulation game - Nightly build from SVN"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('gcc-libs' 'zstd' 'zlib' 'sdl2' 'hicolor-icon-theme' 'freetype2' 'miniupnpc' 'fluidsynth')
makedepends=('subversion' 'pkgconf' 'cmake')
optdepends=('soundfont-fluid: Default MIDI soundfont for music'
			'soundfont-realfont: Alternative higher quality MIDI soundfont'
            'simutrans-pak32.comic: Lowest resolution graphics set for Simutrans'
            'simutrans-pak48.excentrique: Low resolution graphics set for Simutrans, with an eccentric theme'
            'simutrans-pak64: Low resolution graphics set for Simutrans'
            'simutrans-pak64.classic: Low resolution graphics set for Simutrans, resembling the original'
            'simutrans-pak64.contrast: Minimalistic, low resolution graphics set for Simutrans'
            'simutrans-pak64.german: Low resolution graphics set for Simutrans, with a german theme'
            'simutrans-pak64.ho-scale: Resolution graphics set for Simutrans for model train fans'
            'simutrans-pak64.japan: Low resolution graphics set for Simutrans, with a japan theme'
            'simutrans-pak64.nippon: An alternative japanese low resolution graphics set for Simutrans'
            'simutrans-pak64.scifi: Low resolution graphics set for Simutrans, with a SciFi theme'
            'simutrans-pak96.comic: Medium resolution graphics set for Simutrans, with a comic style'
            'simutrans-pakhd: Hand-drawn graphics set for Simutrans'
            'simutrans-pak128: High resolution graphics set for Simutrans'
            'simutrans-pak128.britain: High resolution graphics set for Simutrans, with a british theme'
            'simutrans-pak128.cs: High resolution graphics set for Simutrans, with a czech theme'
            'simutrans-pak128.german: High resolution graphics set for Simutrans, with a german theme'
            'simutrans-pak128.japan: High resolution graphics set for Simutrans, with a japan theme'
            'simutrans-pak192.comic: Highest resolution graphics set for Simutrans')

conflicts=('simutrans')
source=($pkgname::svn+svn://servers.simutrans.org/simutrans/trunk)
sha256sums=('SKIP')

build() {
  cmake -S $pkgname -B build 
  cmake build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DUSE_GAMES_DATADIR=1
  cmake --build build -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/simutrans/license.txt "$pkgdir/usr/share/licenses/simutrans/license.txt"
}

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
