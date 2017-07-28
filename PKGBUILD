# Maintainer : <dikarill [at] b-tu [dot] de>
# Contributor : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsmfm-gtk2-git
pkgver=201707281638
pkgrel=2
url="https://sde-gui.github.io/"
pkgdesc="File managment framework for Stuurman Project. Fork of PCManFM's libfm."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'glib2' 'menu-cache' 'libsmfm-core-git' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'gtk-doc' 'automake')
provides=('libsmfm-gtk2' )
conflicts=('libsmfm-gtk2')

source=('git+git://github.com/sde-gui/libsmfm-gtk.git')
md5sums=('SKIP')

_gitname="libsmfm-gtk"

pkgver() {
  date +%Y%m%d%H%M
}

build() {
    cd "${_gitname}"

    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-actions \
        --enable-silent-rules \
        --enable-demo \
        --with-gtk=2 \
        --with-gnu-ld --|| return 1
    make
}

package () {
    cd "${_gitname}"
    make DESTDIR="$pkgdir/" install
}

