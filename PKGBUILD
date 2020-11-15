# Maintainer: Spencer Harmon

pkgname="vendor-reset-git"
pkgver=0.0.17.r94
pkgrel=1
epoch=
pkgdesc="reset routines for navi et al."
arch=('any')
url="https://github.com/gnif/vendor-reset"
license=('GPL-2.0')
groups=()
depends=()
makedepends=('make'
  'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags' '!makeflags' '!emptydirs')
install=
changelog=
source=("git://github.com/gnif/vendor-reset")
noextract=()
md5sums=('SKIP')
pkgver(){
  cd $srcdir/vendor-reset
  printf '%s.r%s' $(. dkms.conf; echo $PACKAGE_VERSION) $(git rev-list --count HEAD)
}

build() {
  cd vendor-reset
  make
}

package() {
  cd vendor-reset
  OUTDIR=$pkgdir/usr/lib/modules/$(uname -r)/
  mkdir -p $OUTDIR
  cp /lib/modules/$(uname -r)/modules.order $OUTDIR 
  cp /lib/modules/$(uname -r)/modules.builtin $OUTDIR 
  make INSTALL_MOD_PATH="$pkgdir/usr/" install
  rm $OUTDIR/modules*
}