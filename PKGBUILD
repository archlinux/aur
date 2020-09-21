# Maintainer: Sebastian Oechsle <setboolean@icloud.com>
pkgname=afpfsng_git
pkgver=f6e24eb
pkgrel=2
pkgdesc="Fork of afpfs-ng that adds IPv6 support and several performance and stability improvements."
arch=('x86_64')
url="https://github.com/simonvetter/afpfs-ng"
license=('GPL3')
groups=()
depends=('fuse3' 'libgcrypt')
optdepends=()
makedepends=('git')
provides=("afpfs-ng")
conflicts=("afpfs-ng")
replaces=()
backup=()
options=()
install=
source=('001-cmdlineafp.patch' 'git+https://github.com/simonvetter/afpfs-ng.git')
noextract=()
sha512sums=('e7486fd27d81893c24469c2feb1c2d6f2b2f821a6e9068ef70a0236e3045927a72f040240ffcec1a2dbfa10311e12b392cf3e49c19d98cc6b7aafdbe42fb33c9'
            'SKIP')

pkgver() {
  cd "$srcdir/afpfs-ng"
  git describe --always
}

prepare() {
    cd "$srcdir/afpfs-ng"
    patch --forward --strip=1 --input="${srcdir}/001-cmdlineafp.patch"
}

build() {
	cd "$srcdir/afpfs-ng"
	./configure
	make
}

package() {
	cd "$srcdir/afpfs-ng"
	make DESTDIR="$pkgdir/" prefix="/usr/" install
}

