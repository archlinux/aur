# Maintainer: Rui Shi <1229408499@qq.com>
# Contributor: Linxuan Chen <me@black-desk.cn>
pkgname=linglong-box-git
pkgver=1.3.3.15.1.r12.gc633517
pkgrel=1
epoch=0
pkgdesc='Container application toolkit of deepin'
arch=('x86_64')
conflicts=('linglong-box')
provides=('linglong-box')
url='https://github.com/linuxdeepin/linglong-box'
license=('LGPL3')
depends=(
	'libseccomp'
	'glibc'
	'gcc-libs'
)
makedepends=(
	'git'
	'yaml-cpp'
	'gtest'
	'cmake'
)
source=("linglong-box::git+https://github.com/linuxdeepin/linglong-box.git#branch=release/1.3")
md5sums=('SKIP')

pkgver() {
        cd linglong-box
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        cd linglong-box
        mkdir -vp build
}

build() {
        cd linglong-box/build
        cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DBUILD_STATIC=off \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_INSTALL_SYSCONFDIR=/etc \
	      -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
	      ..
        cmake --build . -j$(nproc)
}

package() {
        cd linglong-box/build
        env DESTDIR="$pkgdir/" cmake --install .
}
