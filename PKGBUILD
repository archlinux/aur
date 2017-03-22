# Maintainer: Your Name <youremail@domain.com>
pkgname=env-modules
pkgver=3.2.10
pkgrel=2
epoch=
pkgdesc="Provides for an easy dynamic modification of a user's environment via modulefile."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/modules/"
license=('GPLv2')
groups=()
depends=('tcl>=7.4' 'procps-ng')
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

source=("https://sourceforge.net/projects/modules/files/Modules/modules-$pkgver/modules-$pkgver.tar.gz" modules.sh)
noextract=()
md5sums=('8b097fdcb90c514d7540bb55a3cb90fb'
         '38e1de45377a991380602f2c011ec306')
validpgpkeys=()

build() {
	cd "modules-$pkgver"
	CPPFLAGS="-DUSE_INTERP_ERRORLINE" ./configure --prefix=/usr
	make
}

check() {
	cd "modules-$pkgver"
	make -k check
}

package() {
  cd "modules-$pkgver"
  make DESTDIR="$pkgdir/" install

  ln -s $pkgver ${pkgdir}/usr/Modules/default
  _profiled="$pkgdir/etc/profile.d/"
  mkdir -p "$_profiled"
  ln -sf /usr/Modules/default/init/csh $_profiled/modules.csh
  cp $srcdir/modules.sh $_profiled/modules.sh
}
