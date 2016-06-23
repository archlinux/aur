# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=ncursesfm-git
_gitname=ncursesFM
pkgver=v3.0.r77.gf25cc3c
pkgrel=1
pkgdesc="A FileManager written in c and ncurses library."
arch=('i686' 'x86_64')
url="https://github.com/FedeDP/${_gitname}"
license=('GPL')
depends=('ncurses' 'libconfig' 'libarchive' 'glibc' 'libcups' 'libx11' 'systemd')
optdepends=('xdg-utils: xdg-open support'
            'udisks2: mountable drives and ISO mount support'
            'packagekit: package installation support'
            'upower: AC (dis)connection events support')
# libcups, libconfig and libx11 are optional build dep.
# If compiled without them, the program will run just fine;
# but that would disable xdg-open, config file read and printing support.
# systemd too is an optdep. But in arch libudev is packaged together with it,
# and libudev is a mandatory dep.
makedepends=('git' 'bash-completion')
source=("git://github.com/FedeDP/${_gitname}.git")
backup=('etc/default/ncursesFM.conf')
install=ncursesFM.install
sha256sums=("SKIP")

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_gitname
    make
}

package() {
    cd $srcdir/$_gitname
    make DESTDIR="$pkgdir" install
}
