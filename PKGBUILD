# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=chronojump
pkgname=$_name-git
pkgver=1.7.0.40.gd9f9425b
pkgrel=1
pkgdesc="Measurement, management and statistics of sport short-time tests"
arch=('x86_64' 'i686')
url="http://chronojump.org/"
license=('GPL')
depends=('gstreamer0.10-base' 'python' 'gtk2')
makedepends=('gtk-sharp-2' 'mono' 'intltool' 'git')
provides=($_name)
conflicts=($_name)
options=(!libtool)
install=$pkgname.install
source=("git+https://git.gnome.org/browse/$_name")
md5sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long | sed 's/-/./g'
}

prepare() {
    cd "$_name"
    NOCONFIGURE=1 ./autogen.sh
     # fix path for mono 4.6.1.3-1
    sed -i 's|/mono/4.0/|/mono/4.5/|' configure
    
}

build() {
    cd "$_name"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$_name"
    make -k check || true
}

package() {
    cd "$_name"
    make DESTDIR="$pkgdir" install
}
