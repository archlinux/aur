#Maintainer : Grigory Mishchenko <grishkokot[at]gmail[dot]com>

pkgname=menu-cache-git
pkgver=1.0.1.1.g2932d67
pkgrel=1
pkgdesc='Caching mechanism for freedesktop.org compliant menus'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
depends=('intltool' 'glib2' 'libfm-extra')
options=('!libtool')
makedepends=('gtk-doc' 'git' 'intltool' 'pkg-config' 'automake' 'pkgconfig')
conflicts=('menu-cache')
provides=('menu-cache')
source=("git+https://github.com/lxde/menu-cache.git")
md5sums=('SKIP')

_gitname="menu-cache"

pkgver() {
    cd $_gitname
    git describe | sed 's/^v//;s/-/./g'
}

build() {
    cd $_gitname
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib \
      --disable-static
    make
}

package() {
    cd "${_gitname}"
    make DESTDIR="$pkgdir" install
}
