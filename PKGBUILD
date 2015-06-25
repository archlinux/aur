# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=ncursesfm-git
_gitname=ncursesFM
pkgver=0.r209.f9dd23d
pkgrel=1
pkgdesc="A FileManager written in c and ncurses library."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('ncurses' 'libconfig' 'libarchive' 'libcups' 'openssl' 'libx11')
optdepends=('fuseiso: for fuse archive/iso mounting support'
            'xdg-utils: xdg-open support')
#depends=('git') -> libcups, openssl and libx11 are optional build dep.
#                   If compiled without them, the program will run just fine;
#                   but that would disable xdg-open, sha/md5sum and printing support.
makedepends=('git')
source=("git://github.com/FedeDP/${_gitname}.git")
backup=('etc/default/ncursesFM.conf')
install=ncursesFM.install
sha256sums=("SKIP")

pkgver() {
  cd $_gitname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd $srcdir/$_gitname
    make ncursesFM
    make clean
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR="$pkgdir" install
}
