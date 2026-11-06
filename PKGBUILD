# Maintainer: Alejandro Valdes  <alejandrovaldes at live dot com>
pkgname=yuview
_pkgname=YUView
pkgver=2.15
pkgrel=1
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset"
arch=('x86_64')
url="https://github.com/IENT/YUView"
license=('GPL3')
depends=('qt5-base'
         'qt5-charts'
         'desktop-file-utils'
         'libde265')
optdepends=('vvdec: support for VVC/H.266')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname" "$_pkgname")
source=("git+$url.git#tag=v$pkgver"
        'archlinux.patch')
noextract=()
md5sums=('SKIP'
         '46be4d900fcbbef79fe6129290dd6998')
install="$pkgname.install"

prepare() {
    cd "${_pkgname}"
    patch -p1 < "${srcdir}/archlinux.patch"
}

build() {
    cmake -B build -S "${_pkgname}"
    cmake --build build -j 4
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
