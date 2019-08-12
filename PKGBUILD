# Maintainer: Eric Spreen <erispre@gmail.com>
pkgname=gnunet-gtk-git
pkgdesc="A framework for secure peer-to-peer networking (GTK 3 interfaces)"
pkgver=0.11.6.r1.gbd150825
pkgrel=1
arch=('i686' 'x86_64')
url="http://gnunet.org"
license=('GPL3')
conflicts=('gnunet-gtk')
provides=('gnunet-gtk')
depends=('gnunet-git' 'gtk3' 'libglade' 'glade')
source=('git+https://gnunet.org/git/gnunet-gtk.git')
md5sums=('SKIP')

pkgver() {
    cd gnunet-gtk
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "${srcdir}/gnunet-gtk"
    ./bootstrap
    ./configure --prefix=/usr --with-gnunet=/usr
    make
}

package() {
    cd "${srcdir}/gnunet-gtk"
    make DESTDIR="${pkgdir}/" install
}
