# Contributor: Chia-Wei Li <dreamcwli@gmail.com>
# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
# Contributor: Yu-Shin Huang <hyslion AT gmail.com>

pkgname=pcmanx-gtk2-git
pkgver=717.ad0af3a
pkgrel=1
pkgdesc="A gtk+ based free BBS client"
url="http://code.google.com/p/pcmanx-gtk2"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'librsvg')
makedepends=('autoconf' 'automake' 'git' 'intltool')
options=('!libtool')
provides=('pcmanx-gtk2')
conflicts=('pcmanx-gtk2')
source=('git://github.com/pcman-bbs/pcmanx')
md5sums=('SKIP')
_gitname='pcmanx'

pkgver() {
    cd ${srcdir}/${_gitname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd ${srcdir}/${_gitname}

    ./autogen.sh
    ./configure --prefix=/usr --enable-iplookup
}

build() {
    cd ${srcdir}/${_gitname}
    make
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install
}
