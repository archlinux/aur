# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.60
pkgrel=4
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=('i686' 'x86_64')
url="https://github.com/MCMic/jumpnbump"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net')
optdepends=('jumpnbump-levels: more levels for jumpnbump' 'jumpnbump-menu: a launcher for jumpnbump')
source=(jumpnbump::git+https://github.com/MCMic/jumpnbump#commit=0785e55 safe-temporary-files.patch)
sha256sums=('SKIP'
            'f99113c04b988d2e2048b79bb58bfeba26b3aeea3937936b97b06334d34a5c4c')

build() {
  cd "${srcdir}/${pkgname}/"
  
  for i in 'safe-temporary-files.patch'
  do
     patch -p1 < ${srcdir}/$i
  done
  
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX="${pkgdir}/usr/" install
  
  install -d $pkgdir/usr/lib/jumpnbump
  mv $pkgdir/usr/bin/gobpack $pkgdir/usr/lib/jumpnbump/gobpack
  mv $pkgdir/usr/bin/jnbpack $pkgdir/usr/lib/jumpnbump/pack
  mv $pkgdir/usr/bin/jnbunpack $pkgdir/usr/lib/jumpnbump/unpack
}
