# Maintainer: MioLovesTio < mishazai1997@gmail.com >

pkgname=rainbow-cm-git
pkgver=202305221225
pkgrel=1
pkgdesc="A lightweight clipboard manager for X11"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/sde-gui/rainbow-cm"
depends=('gtk2' 'desktop-file-utils' 'sde-reverse-meta-git')
install=rainbow-cm.install
makedepends=('git' 'intltool' 'pkg-config' 'automake')
provides=('rainbow-cm')
conflicts=('rainbow-cm')

source=('git+https://github.com/sde-gui/rainbow-cm.git')
md5sums=('SKIP')

_gitname="rainbow-cm"

pkgver() {
  date +%Y%m%d%H%M
}

build() {
    if [ -f "$MAKEPKG_CONFIGURE_HOOK" ] ; then
        . "$MAKEPKG_CONFIGURE_HOOK"
    fi

    cd "${_gitname}"

    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-silent-rules

    if [ -f "$MAKEPKG_BUILD_HOOK" ] ; then
        . "$MAKEPKG_BUILD_HOOK"
    fi

    make
}

package() {
    cd "${_gitname}"
    make DESTDIR="$pkgdir" install
}

