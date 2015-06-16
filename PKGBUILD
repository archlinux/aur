# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Malte Rabenseifner <malte@zearan.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: 3ED <kas1987@o2.pl>

pkgname=gimmix
pkgver=0.5.7.2
pkgrel=3
pkgdesc="Graphical MPD client written in C using GTK+2"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gimmix.berlios"
license=('GPL')
depends=('desktop-file-utils' 'libglade>=2.6.0' 'libmpd>=0.17.0' 'taglib' 'libnxml')
makedepends=('intltool')
install=gimmix.install
source=("http://sourceforge.net/projects/gimmix.berlios/files/gimmix-0.5.7.2.tar.bz2"
        "fix-build.patch")
sha256sums=('860588d13d66631e52ee57e6b31dfbf5f1493e2be3a4649231a7cf3c8d56ee27'
            'bad58e73d874f44388abc4329197f364c2ffb89aae50980d200a9d6e244fda59')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i '/curl\/types.h/d' src/gimmix-{lyrics,covers}.c
    patch -p0 -i "$srcdir/fix-build.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr --enable-cover --enable-lyrics
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
