# Maintainer: Dorian Wouters <gravgun at openmailbox dot org>
# Contributor: Pierre Carru <pierre.carru@gmail.com>
pkgname=xfce4-multiload-nandhp-plugin-git
pkgver=20130612
pkgrel=2
pkgdesc='Multiload panel plugin for Xfce panel'
arch=('i686' 'x86_64')
url="http://github.com/nandhp/multiload-nandhp"
license=('GPL2')
groups=('xfce4-goodies')
depends=('pacman' 'xfce4-panel>=4.7.4' 'libxfce4ui' 'libgtop')
makedepends=('git' 'intltool')

source=('git://github.com/nandhp/multiload-nandhp.git')
md5sums=('SKIP')

_gitname='multiload-nandhp'

build() {
    cd $_gitname

    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-fast-install \
        --disable-static \
        --with-xfce4
    make
}

package() {
    cd $_gitname
    make DESTDIR="$pkgdir" install
    rm -f $pkgdir/usr/lib/xfce4/panel/plugins/libmultiload.la
}

