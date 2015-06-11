# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=ncursesfm-git
_gitname=ncursesFM
pkgver=0.r181.d4004da
pkgrel=1
pkgdesc="A FileManager written in c and ncurses library."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('ncurses' 'libconfig' 'libarchive')
optdepends=('libcups: for printing support'
            'fuseiso: for fuse archive/iso mounting support'
            'openssl: for shasum viewing support'
            'libx11: used to check if program is started in a X screen'
            'xdg-utils: xdg-open support')
makedepends=('git' 'libcups' 'openssl' 'libx11')
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
    mkdir -p $pkgdir/usr/bin
    install -Dm755 ncursesFM $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/default
    install -Dm644 ncursesFM.conf $pkgdir/etc/default
}
