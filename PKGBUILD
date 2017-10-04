# Contributor: Chia-Wei Li <dreamcwli@gmail.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
# Contributor: Yu-Shin Huang <hyslion AT gmail.com>

pkgname=pcmanx-gtk3-git
pkgver=743.3b3ab60
pkgrel=1
pkgdesc="A gtk+ based free BBS client (yan12125's experimental GTK+3 branch)"
url="https://github.com/pcman-bbs/pcmanx"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3' 'librsvg' 'libltdl')
# This requires gtk2 due to the AM_PATH_GTK_2_0 macro in configure.ac
makedepends=('autoconf' 'automake' 'git' 'intltool' 'gtk2')
options=('!libtool')
provides=('pcmanx-gtk2')
conflicts=('pcmanx-gtk2')
source=('git+https://github.com/yan12125/pcmanx#branch=wip-gtk3')
md5sums=('SKIP')
_gitname='pcmanx'

pkgver() {
    cd ${srcdir}/${_gitname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd ${srcdir}/${_gitname}

    ./autogen.sh
    ./configure --prefix=/usr --enable-iplookup --enable-gtk3 --enable-debug
}

build() {
    cd ${srcdir}/${_gitname}
    make
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install
}
