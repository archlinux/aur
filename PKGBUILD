# Maintainer: Luca Corbatto <luca-arch@corbatto.de>
_pkgname=evolution-rss
pkgname=$_pkgname-git
pkgver=0.3.95.r41.gc78ce39
pkgrel=1
pkgdesc="RSS-Plugin for evolution"
arch=(i686 x86_64)
url="http://gnome.eu.org/evo/index.php/Evolution_RSS_Reader_Plugin"
license=('GPL')
depends=('evolution' 'webkitgtk' 'gtkhtml4')
makedepends=('gnome-common' 'automake>=1.8' 'autoconf>=2.53' 'intltool>=0.25' 'gettext' 'pkg-config>=0.14.0')
install=$_pkgname.install
source=('git://github.com/GNOME/evolution-rss.git')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"

    ./autogen.sh --prefix=/usr \
        --localstatedir=/var

    make
}

package() {
    cd "$srcdir/$_pkgname"

    make DESTDIR="$pkgdir" install
}

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long | sed 's/^EVOLUTION_RSS_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}
