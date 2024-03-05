# Maintainer: Eric Spreen <erispre@gmail.com>
pkgname=gnunet-gtk-git
pkgver=0.19.2.1.r12.2aadd292
pkgrel=1
pkgdesc="A framework for secure peer-to-peer networking (GTK 3 interfaces)"
arch=('i686' 'x86_64')
url="http://gnunet.org"
license=('GPL3')
groups=()
depends=('gnunet-git' 'gtk3' 'libglade' 'glade')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://git.gnunet.org/gnunet-gtk.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    ./bootstrap
}

build() {
    cd "$srcdir/${pkgname%-git}"

    ./configure --prefix=/usr --with-gnunet=/usr
    make
}

package() {
    cd "${srcdir}/gnunet-gtk"
    make DESTDIR="${pkgdir}" install
}
