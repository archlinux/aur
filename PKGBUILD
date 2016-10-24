# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=nfbv-git
pkgver=r27.f1a79eb
pkgrel=1
pkgdesc='Fork of fbv (FrameBuffer Viewer)'
arch=('armv7h')
url='https://github.com/dankamongmen/nfbv'
license=('GPL2')
depends=('libjpeg' 'libpng' 'giflib')
makedepends=('git')
provides=('nfbv')
conflicts=('nfbv')
source=("git+https://github.com/dankamongmen/nfbv.git"
        '0001-libgif7-support.patch'
        '0003-make_install_dirs.patch')
md5sums=('SKIP'
         '88b3d9fe1f902519941fefd8bf5a5e62'
         '7077110c9a56bc0c35a2d9020711c460')

pkgver() {
    cd nfbv
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd nfbv
    patch -p1 -i "${srcdir}/0001-libgif7-support.patch"
    patch -p1 -i "${srcdir}/0003-make_install_dirs.patch"
}

build() {
    cd nfbv
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd nfbv
    make DESTDIR="${pkgdir}" install
}
