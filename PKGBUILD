# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on work made by Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu-git
_pkgname=brisk-menu
_gitname=brisk
pkgver=0.6.2.r3.g71cced4
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment - git version'
arch=('i686' 'x86_64')
url='https://github.com/getsolus/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel' 'libnotify')
makedepends=('gnome-common' 'gettext' 'itstool' 'vala>=0.36' 'meson' 'ninja')
optdepends=('mozo: for menu edition'
		'menulibre: for menu edition') 
options=('!libtool' '!emptydirs')
provides=('brisk-menu')
conflicts=('brisk-menu')
source=(git+https://github.com/getsolus/brisk-menu.git)
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/brisk-menu"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48

}

build() {
    cd "$srcdir/brisk-menu"
    meson --buildtype plain build --prefix=/usr --libexecdir=/usr/lib/${_pkgname}

    ninja -C build -j$(($(getconf _NPROCESSORS_ONLN)+1))
}

package() {
    cd "$srcdir/brisk-menu"
    DESTDIR="$pkgdir" ninja -C build install
}



