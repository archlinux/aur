# Maintainer: Ben Iofel <iofelben@gmail.com>
# Contributor: Patrick Griffis <tingping@tingping.se>

_gitname='vaccine'
pkgname=vaccine-git
pkgver=0.0.1.r265.g760bb40
pkgrel=1
pkgdesc="A GTK+3 4chan client for the linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/VaccineApp/vaccine"
license=('GPL3')
depends=('gtk3' 'libsoup' 'json-glib' 'libgee')
makedepends=('git' 'automake' 'autoconf-archive' 'vala')
install='vaccine.install'
provides=('vaccine')
conflicts=('vaccine')
source=('vaccine::git+https://github.com/VaccineApp/vaccine.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"

    # No tags yet..
    _ver=`autoconf -t 'AC_INIT:$2'`
    _rev=`git rev-list --count HEAD`
    _hash=`git rev-parse --short HEAD`
    echo "$_ver.r$_rev.g$_hash"
}

build() {
    cd "$_gitname"
    ./autogen.sh --prefix=/usr --disable-debug
    make -s
}

package() {
    cd "$_gitname"
    DESTDIR="$pkgdir" make install
}
