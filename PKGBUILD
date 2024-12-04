# Contributor: M A <morealaz at gmail dot com>
# Contributor: Saeid Ahmed <itsaeid@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Rob Lynn <rob22uk at gmail dot com>
# Contributor: DerFlob <derflob at derflob dot de>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=tilda-wayland
pkgver=1.5.4.r0.gbc2d321
pkgrel=1
pkgdesc="A Gtk based drop down terminal for Linux and Unix, Workaround for wayland."
arch=('x86_64')
url="https://github.com/shih-liang/tilda-wayland"
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
