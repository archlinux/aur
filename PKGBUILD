# Maintainer: Mewp <aur.archlinux.org@mewp.pl>
pkgname=emptyepsilon
pkgver=2017.01.19
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
          .
	make
}

prepare() {
    patch -Np1 < ../fixed-version.patch
}

package() {
	cd $srcdir/EmptyEpsilon
	make DESTDIR="$pkgdir/" install
}

