# Maintainer: Your Name <youremail@domain.com>
pkgname=env-modules-tcl
pkgver=1.832
pkgrel=3
epoch=
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile (tcl-only-version)."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/modules/"
license=('GPLv2')
groups=()
depends=('tcl>=7.4')
makedepends=()
checkdepends=('dejagnu')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://sourceforge.net/projects/modules/files/Modules-Tcl/modules-tcl-$pkgver.tar.gz")
md5sums=('3a40bf6177cc438481672ce028544828')
noextract=()
validpgpkeys=()

build() {
    cd modules-tcl-$pkgver
    ./configure --prefix=/usr --disable-set-binpath --disable-set-manpath
    make
}

package() {
  cd "modules-tcl-$pkgver"
  make DESTDIR="$pkgdir/" install

  _profiled="$pkgdir/etc/profile.d/"
  mkdir -p "$_profiled"
  ln -s /usr/init/profile.csh $_profiled/env-modules-tcl.csh
  ln -s /usr/init/profile.sh $_profiled/env-modules-tcl.sh
}

