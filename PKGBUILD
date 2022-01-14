# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-screensaver-git
pkgver=3.6.0.r58.g19b0852
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
    ./autogen.sh
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
