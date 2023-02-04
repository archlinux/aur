# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributors: carstene1ns, Arkham, Christoph Zeiler, JD Steffen

pkgname=eduke32
_pkgdate=20230123
_pkgrev='10167-1a90b9883'
pkgver=$_pkgdate.r${_pkgrev/-/_}
pkgrel=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('i686' 'x86_64')
url="http://eduke32.com/"
license=('GPL' 'custom: BUILD')
depends=('libvpx' 'sdl2' 'flac' 'libvorbis' 'alsa-lib')
makedepends=('mesa' 'glu')
depends_i686=('lib32-alsa-lib')
makedepends_i686=('nasm')
optdepends=('freepats-legacy: a free soundfont for music'
            'fluidsynth: alternative midi sequencer'
            'eduke32-shareware-episode: Duke Nukem 3D Demo')
install=$pkgname.install
source=("http://dukeworld.com/$pkgname/synthesis/$_pkgdate-$_pkgrev/eduke32_src_$_pkgdate-$_pkgrev.tar.xz"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('8baf8290760a66a5383ca31f42d2cfa169a5a625e148b39c9cbb4766bbfffdfd'
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
