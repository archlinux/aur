# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-screensaver-git
pkgver=3.6.0.r75.gd72022b
pkgrel=1
pkgdesc="Budgie's fork of GNOME's legacy screensaver"
arch=('x86_64')
license=('GPL2')
url="https://github.com/BuddiesOfBudgie/budgie-screensaver"
depends=('dbus-glib' 'budgie-desktop')
makedepends=('git' 'intltool' 'gnome-common')
optdepends=('gnome-backgrounds: default background')
provides=('gnome-screensaver' 'budgie-screensaver')
conflicts=('gnome-screensaver' 'budgie-screensaver')
source=("${pkgname}::git+https://github.com/BuddiesOfBudgie/budgie-screensaver")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$pkgname"
    arch-meson build --prefix=/usr --sysconfdir=/etc --buildtype plain
}

build() {
    cd "$srcdir/$pkgname"
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR=$pkgdir ninja -C build install
}
