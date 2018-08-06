# Maintainer: Karol Babioch <karol@babioch.de

pkgname=xwmfs-git
pkgver=0.82.r0.gdf2b3c5
pkgrel=1
pkgdesc="X11 Window-Manager file system based on FUSE"
arch=('x86_64')
url="https://github.com/gerstner-hub/xwmfs"
license=('GPL2')
depends=('fuse')
source=("git+https://github.com/gerstner-hub/xwmfs.git#tag=v$pkgver")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/xwmfs"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/xwmfs"
    ./bootstrap
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/xwmfs"
    make DESTDIR="${pkgdir}" install
}

