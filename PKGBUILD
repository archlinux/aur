# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=ncursesfm-git
_gitname=ncursesFM
pkgver=0.r416.4ea8b90
pkgrel=2
pkgdesc="A FileManager written in c and ncurses library."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('ncurses' 'libconfig' 'libarchive' 'glibc' 'libcups' 'libx11' 'systemd' 'openssl')
optdepends=('xdg-utils: xdg-open support'
            'udisks2: mountable drives and ISO mount support'
            'packagekit: package installation support')
# libcups, libconfig, libx11, openssl, and systemd are optional build dep.
# If compiled without them, the program will run just fine;
# but that would disable xdg-open, config file read, printing, shasum,
# powermanagement inhibition, drives/iso mount and local packages installation support.
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
