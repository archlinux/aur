# Maintainer Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=openrc-arch-services-git
pkgdesc="Arch Linux service scripts for openrc"
pkgver=0.26
pkgrel=1
url="https://github.com/andrewgregory/openrc-arch-services"
license=('GPL2')
arch=('any')
# backup=() #fill in below
source=("$pkgname::git://github.com/andrewgregory/openrc-arch-services.git")
md5sums=('SKIP')

_sysconfdir='etc/openrc' # DO NOT include leading '/'

pkgver() {
    cd "$srcdir/$pkgname"
    echo "0.$(git rev-list HEAD | wc -l)"
}

build() {
    cd "$srcdir/$pkgname"
    make SBINDIR=/usr/bin RUNSCRIPT=openrc-run
}

package() {
    cd "$srcdir/$pkgname"
    make SYSCONFDIR="$_sysconfdir" DESTDIR="$pkgdir" install

    # add conf.d files to backup
    cd "$pkgdir"
    backup=("$_sysconfdir"/conf.d/*)
}
