# Maintainer: Moritz Bruder <muesli4@gmail.com>
pkgname=gclipboard-git
pkgver=r41.2704588
pkgrel=1
pkgdesc='A simple clipboard manager with a clean design approach.'
arch=('x86_64' 'i686')
url='http://github.com/muesli/gclipboard'
depends=('gtkmm3')
makedepends=('git' 'automake' 'autoconf' 'make' 'boost' 'gettext' 'glib2' 'gtkmm3')
provides=('gclipboard')
source=($pkgname::git://github.com/muesli4/gclipboard.git)

md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
