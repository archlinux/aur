# Contributor Andrew Gregory <andrew.gregory.8@gmail.com>

_name=openrc-arch-services
pkgname=openrc-arch-services-git
pkgdesc="Arch Linux service scripts for openrc"
pkgver=r29.2a1af95
pkgrel=1
url="https://github.com/andrewgregory/openrc-arch-services"
license=('GPL-2.0-only')
makedepends=('git')
arch=('any')
# backup=() #fill in below
source=("git+https://github.com/andrewgregory/openrc-arch-services.git")
md5sums=('SKIP')

_sysconfdir='etc/openrc' # DO NOT include leading '/'

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_name"
    make SBINDIR=/usr/bin RUNSCRIPT=openrc-run
}

package() {
    cd "$_name"
    make SYSCONFDIR="$_sysconfdir" DESTDIR="$pkgdir" install

    # add conf.d files to backup
    cd "$pkgdir"
    backup=("$_sysconfdir"/conf.d/*)
}
