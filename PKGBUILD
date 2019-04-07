# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Arkham, Christoph Zeiler, JD Steffen

pkgname=eduke32
_pkgdate=20190406
_pkgrev=7490
pkgver=$_pkgdate.r$_pkgrev
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libgl' 'libvpx' 'flac' 'gtk2')
makedepends=('mesa' 'glu')
makedepends_i686=('nasm')
optdepends=('eduke32-hrp: High Resolution Pack'
            'eduke32-dukeplus: Enhanced Mod'
            'freepats-legacy: a free soundfont for music'
            'fluidsynth: alternative midi sequencer'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
install=$pkgname.install
source=("http://dukeworld.com/$pkgname/synthesis/$_pkgdate-$_pkgrev/eduke32_src_$_pkgdate-$_pkgrev.tar.xz"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('9343323c1da07a161ac45137a60020f9fef7dce9fa9bf50a256b658f373f3f8f'
            'b55a264b4682afabd49587d700d4c85ce6c2e7af7ce2764dd217ebe167549863'
            'cf2ea2c6a0d85ab15e30171ed5b921f1fcf5644de7af9638c0ef60de21c44f24')

build() {
  cd eduke32_$_pkgdate-$_pkgrev

  # add cxxflags, set revision
  make PACKAGE_REPOSITORY=1 VC_REV=$_pkgrev #PRETTY_OUTPUT=0
}

package() {
  cd eduke32_$_pkgdate-$_pkgrev

  # install binaries, buildlicense, icon and desktop files
  install -d "$pkgdir"/usr/bin
  install -m755 eduke32 mapster32 "$pkgdir"/usr/bin
  install -Dm644 package/common/buildlic.txt "$pkgdir"/usr/share/licenses/$pkgname/buildlic.txt
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
