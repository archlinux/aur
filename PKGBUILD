# Maintainer: Jonas Köritz <jonas.koeritz at gmail dot com>
# Contributor: 	Olivier Médoc <o_medoc at yahoo dot fr>

pkgname=('libvhdi-git')
pkgver=r142.58c6aa2
pkgrel=2
pkgdesc="Library and tools to access the Virtual Hard Disk (VHD) image format"
arch=('x86_64')
url="https://github.com/libyal/libvhdi"
license=('LGPL3')
depends=('python2' 'python' 'fuse')
makedepends=('gcc' 'git' 'automake' 'autoconf' 'gettext' 'libtool' 'pkg-config')
provides=('libvhdi' 'python2-libvhdi' 'python3-libvhdi')

source=("${pkgname}::git://github.com/libyal/libvhdi.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    ./synclibs.sh
    ./autogen.sh
}

build() {
    cd "$pkgname"
    ./configure --prefix=/usr --enable-python2 --enable-python3
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}