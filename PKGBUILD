# Maintainer: Han Young <hanyoung@protonmail.com>
# Contributor: Yaron de Leeuw < me@jarondl.net >
pkgname=libzim-git
pkgver=1677.9bc584e
pkgrel=1
pkgdesc="The standard implementation of the ZIM specification - openzim"
arch=('i686' 'x86_64')
url="https://openzim.org/wiki/Libzim"
license=('GPL2')
makedepends=('git' 'meson' 'ninja' 'gtest' 'pkgconf')
depends=('xz' 'gcc-libs' 'zstd' 'icu' 'xapian-core' 'util-linux-libs')
optdepends=('doxygen: build the documentations'
            'python-breathe: build the documentations'
            'python-sphinx: build the documentations'
            'python-exhale: build the documentations')
conflicts=('libzim')
source=("$pkgname"::git+https://github.com/openzim/libzim.git)
md5sums=('SKIP')

# find version according to 
# http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	mkdir build
	meson --prefix=/usr . build
	ninja -C build
}


package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir/" ninja -C build install
}
 
