# Maintainer: Genki Sky <alt+archlinux.org@genki.is>

pkgname=dlm-git
pkgver=1
pkgrel=1
pkgdesc='Userspace management for linux/fs/dlm'
arch=('i686' 'x86_64')
url='https://pagure.io/dlm'
license=('GPL' 'LGPL')
depends=('libutil-linux' 'ncurses' 'pacemaker' 'zlib')
makedepends=('git')
provides=('dlm')
conflicts=('dlm')
source=('git+https://pagure.io/dlm.git')
md5sums=('SKIP')

pkgver() {
    cd dlm
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd dlm
    make
}

package() {
    cd dlm
    make PREFIX=/usr LIBNUM=lib BINDIR=/usr/bin DESTDIR="$pkgdir" install
    install -D -m 0644 init/dlm.service "$pkgdir"/usr/lib/systemd/system/dlm.service
    install -D -m 0644 init/dlm.sysconfig "$pkgdir"/etc/sysconfig/dlm
}
