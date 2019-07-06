# Maintainer: Iru Dog <mytbk920423@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=systemd-ui-git
pkgver=3.2.g4e6ab2e4
pkgrel=1
pkgdesc="Systemd Session and Startup Manager GUI (Git version)"
arch=('i686' 'x86_64')
url="https://github.com/systemd/systemd-ui"
license=('GPL')
depends=('gtk3' 'libgee' 'libnotify')
makedepends=('git' 'vala' 'docbook-xsl' 'libxslt')
provides=('systemd-ui')
conflicts=('systemd-ui')
source=("$pkgname::git://anongit.freedesktop.org/systemd/systemd-ui.git")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git describe --long | sed 's/v//;s/-/./g'
}

build() {
  cd ${pkgname}
  autoreconf -f -i -s
  ./configure --prefix=/usr
  make
}

package() {
    cd ${pkgname}
    make DESTDIR="$pkgdir" install
}
