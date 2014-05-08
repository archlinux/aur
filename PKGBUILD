# Maintainer: Iru Dog <mytbk920423@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=systemd-ui-git
pkgver=3.0.gbd1d897
pkgrel=1
pkgdesc="Systemd Session and Startup Manager GUI (Git version)"
arch=('i686' 'x86_64')
url="https://github.com/systemd/systemd-ui"
license=('GPL2')
depends=('glib2' 'gtk3' 'libgee' 'libnotify')
makedepends=('git' 'vala' 'docbook-xsl' 'libxslt')
provides=('systemd-ui')
conflicts=('systemd-ui')
source=("git://anongit.freedesktop.org/systemd/systemd-ui.git")
md5sums=('SKIP')
_gitname="systemd-ui"

pkgver() {
    cd ${_gitname}
    git describe --long | sed 's/v//;s/-/./g'
}

build() {
    cd ${_gitname}
    msg2 "Starting autoreconf..."
    autoreconf -f -i -s

    msg2 "Starting configure..."
    ./configure

    msg2 "Starting make..."
    make
}

package() {
    cd ${_gitname}
    msg2 "Starting make install..."
    make DESTDIR="$pkgdir" install
}
