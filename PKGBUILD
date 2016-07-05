# Maintainer:
#   guillaume hayot <postblue@postblue.info>
# Contributors:
#   henning mueller <henning@orgizm.net>

pkgname=legend-of-grimrock
pkgdesc='A 3D grid-based dungeon crawler inspired by classic 1980s and 1990s action role-playing games Dungeon Master, Eye of the Beholder and Ultima Underworld.'
url='http://www.grimrock.net/'
_pkgdate=2013-05-15
pkgver=20130515
pkgrel=1
arch=(i686 x86_64)
license=(custom)
PKGEXT=.pkg.tar
depends=(
  freeimage minizip sdl-hg libvorbis freetype2 zlib openal libgl libx11 libogg
  libxext desktop-file-utils
)
optdepends=('libtxc_dxtn: For Mesa S3TC support.')
source=(
  "local://LegendOfGrimrock-Linux-$_pkgdate.sh"
  $pkgname.desktop
)

[ "$CARCH" != "i686" ] && _arch=x86_64 || {
  _arch=x86
  depends+=(gcc-libs-multilib)
}

package() {
  sh ${source[0]//::/} --tar xf

  _target=$pkgdir/usr/share/$pkgname

  mkdir -p $_target
  lzma -d < instarchive_linux_$_arch | tar xf - -C $_target
  lzma -d < instarchive_all | tar xf - -C $_target

  mkdir -p $pkgdir/usr/bin
  ln -s ../share/$pkgname/Grimrock.bin.$_arch $pkgdir/usr/bin/$pkgname

  install -D $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

sha256sums=('005066be6ce12ba342e499369070113c6b66a9bea03c6ecb1e5fd0758eb0c39d'
            'a989d2d0d896ec4adaf3d66e19050c519d9e58efc8d588a51ab0185283bf21fb')
