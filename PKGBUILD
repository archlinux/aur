# Maintainer: Mewp <aur.archlinux.org@mewp.pl>
pkgname=emptyepsilon
pkgver=2019.05.21
pkgrel=1
epoch=
pkgdesc="Open source spaceship bridge simulator"
arch=('x86' 'x86_64')
url="https://github.com/daid/EmptyEpsilon"
license=('GPL2')
groups=()
depends=('sfml')
makedepends=('cmake' 'git' 'mesa')
source=("git+https://github.com/daid/EmptyEpsilon.git#tag=EE-$pkgver"
        "git+https://github.com/daid/SeriousProton.git#tag=EE-$pkgver")
sha256sums=('SKIP' 'SKIP')

build() {
    cd $srcdir/EmptyEpsilon/
	cmake -DSERIOUS_PROTON_DIR=../SeriousProton/ \
          -DCMAKE_CXX_FLAGS='-DINSTALL_PREFIX=\"/usr\"' \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCPACK_PACKAGE_VERSION_MAJOR=$(echo $pkgver | cut -d. -f1) \
          -DCPACK_PACKAGE_VERSION_MINOR=$(echo $pkgver | cut -d. -f2) \
          -DCPACK_PACKAGE_VERSION_PATCH=$(echo $pkgver | cut -d. -f3) \
          .
	make
}

package() {
	cd $srcdir/EmptyEpsilon
	make DESTDIR="$pkgdir/" install
}

