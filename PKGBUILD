# Maintainer: carstene1ns <arch carsten-teibes de>

_pkgbase=opendune
pkgname=$_pkgbase-git
_gitname=OpenDUNE
pkgver=0.7.6615ef9
pkgrel=1
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="https://github.com/OpenDUNE/OpenDUNE"
license=('GPL2')
depends=('sdl' 'alsa-lib')
makedepends=('git')
optdepends=('timidity++: midi music support')
conflicts=('opendune')
provides=('opendune')
install="$_pkgbase.install"
source=("git://github.com/OpenDUNE/OpenDUNE.git"
        "$_pkgbase.sh"
        "$_pkgbase.desktop"
        "$_pkgbase.png"
        "$_pkgbase.install")
md5sums=('SKIP'
        'acaaaca7340f9b5d8c1d7ccc001ddf57'
        '2ff96b1efe864b1426f950005625af35'
        '4a6fef6e5bdde8ee7f038554bc5ed93b'
        'c997170cd2667920a5988a22b4b1e40f')
sha256sums=('SKIP'
            'a62b0f37084654f3524ca4502c3864f90ef199e01755f5f18f162fa348f2fd2e'
            'f2a41122e61587bb07528764fda1fb116ed00d41bab49d324bdc893607c3c029'
            '89c9cbf76b3f7ac62bf39235a64b191ee4b3bd437f88161b6757b6ec44e8888b'
            'b672aca4ac3bc7d6f4578f2793c02dda5903e4d7cfc8b52a3e3ddc51bfe2816a')

pkgver() {
  cd $_gitname

  # get last annotated tag from packed refs
  echo $(tail -n 2 .git/packed-refs | head -n 1 | cut -d "/" -f 3).$(git rev-parse --short master)
}

build() {
  cd $_gitname

  ./configure --prefix-dir=/opt/opendune

  make
}

package() {
  cd $_gitname

  make INSTALL_ICON_DIR="$pkgdir/opt/$_pkgbase" INSTALL_BINARY_DIR="$pkgdir/opt/$_pkgbase" INSTALL_DOC_DIR="$pkgdir/opt/$_pkgbase/doc" install

  # install binary, icon and desktop files
  install -Dm755 "$srcdir/$_pkgbase.sh" "$pkgdir/usr/bin/$_pkgbase"
  install -Dm644 "$srcdir/$_gitname/bin/data/put_dune2_here.txt" "$pkgdir/opt/$_pkgbase/data/put_dune2_here.txt"
  install -Dm644 "$srcdir/$_pkgbase.png" "$pkgdir/usr/share/pixmaps/$_pkgbase.png"
  install -Dm644 "$srcdir/$_pkgbase.desktop" "$pkgdir/usr/share/applications/$_pkgbase.desktop"
}
