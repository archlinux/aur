# Maintainer: M A <morealaz at gmail dot com>
# Contributor: Saeid Ahmed <itsaeid@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Rob Lynn <rob22uk at gmail dot com>
# Contributor: DerFlob <derflob at derflob dot de>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=tilda-git
pkgver=1.5.0.r0.gbdf581e
pkgrel=2
pkgdesc="A Gtk based drop down terminal for Linux and Unix."
arch=('x86_64')
url="https://github.com/lanoxx/tilda"
license=('GPL')
depends=('confuse' 'vte3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha1sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/^tilda-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-git}
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd ${pkgname%-git}
    make DESTDIR="${pkgdir}/" install
}
# vim:set ts=4 sw=4 et:
