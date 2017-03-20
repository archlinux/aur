# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=upower

pkgname=upower-nosystemd
pkgver=0.99.4+12+g402640b
pkgrel=2
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
depends=('eudev' 'libusb-nosystemd' 'libimobiledevice' 'libgudev-nosystemd')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python2' 'git' 'gtk-doc')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/UPower/UPower.conf')
_commit=402640bee016472bf61c7a4ad9e5fac9790ea1bf
source=(git://anongit.freedesktop.org/upower#commit=$_commit)
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --tags | sed -e 's/UPOWER_//' -e 's/_/\./g' -e 's/-/+/g'
}

build() {
    cd $_pkgname

    NOCONFIGURE=1 ./autogen.sh

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/$_pkgname \
        --disable-static
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
}
