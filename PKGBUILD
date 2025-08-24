# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>
# Contributors: Volodymyr Medvid <vmedvid@riseup.net>,
#               stepych <msaleksandr@gmail.com>

pkgname=kbdd-git
pkgrel=1
pkgver=0.7.1.r21.gb87e44a
provides=('kbdd')
conflicts=('kbdd')
pkgdesc="Simple daemon and library to make per window layout"
arch=('i686' 'x86_64')
url="https://github.com/qnikst/kbdd"
license=('GPL3')
makedepends=('git' 'automake' 'autoconf' 'python' 'glib2-devel')
depends=('glib2' 'libx11' 'dbus-glib')
source=("git+https://github.com/qnikst/kbdd.git")
md5sums=('SKIP')

build() {
    cd "${srcdir}/kbdd"
    aclocal
    autoheader
    automake --add-missing
    autoreconf
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/kbdd"
    make DESTDIR="${pkgdir}" install
}

pkgver() {
    cd "${srcdir}/kbdd"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
