# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xviewer
pkgver=1.6.1
pkgrel=3
pkgdesc="A simple and easy to use image viewer. X-Apps Project."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gtk3' 'glib2' 'cinnamon-desktop' 'libpeas')
makedepends=('gnome-common' 'libglade' 'gobject-introspection')
optdepends=('xviewer-plugins: Extra plugins')
provides=($pkgname)
conflicts=('xviewer-git')
url='https://github.com/linuxmint/xviewer'

_upstreamversion='master.mint19'  # Hmmm...

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${_upstreamversion}.tar.gz")
md5sums=('43df95793771b6ba65b7e0e650994591')

build() {
    cd ${srcdir}/${pkgname}-${_upstreamversion}

    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
         --libexecdir="/usr/lib/${pkgname}"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${_upstreamversion}
    make DESTDIR="$pkgdir/" install
}
