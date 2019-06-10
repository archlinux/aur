# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=cryfs-git
_pkgname=cryfs
pkgver=0.10.2.r131.gd2e5ba7f
pkgrel=1
pkgdesc="CryFS encrypts your files, so you can safely store them anywhere"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.cryfs.org"
license=('LGPL3')
depends=('fuse2' 'crypto++' 'curl')
makedepends=('git' 'cmake' 'boost' 'python')
provides=('cryfs')
conflicts=('cryfs')

source=("$_pkgname"::"git://github.com/$_pkgname/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir cmake && cd cmake
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release ..
}

build() {
	cd "$srcdir/$_pkgname/cmake"
	make
}

package() {
	cd "$srcdir/$_pkgname/cmake"
	make DESTDIR="$pkgdir/" install
}
