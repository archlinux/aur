# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-screensaver-git
pkgver=v5.0.r0.g07dcdfe
pkgrel=1
pkgdesc="Budgie's fork of GNOME's legacy screensaver, latest git"
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
    cd "$pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    arch-meson build --prefix=/usr --sysconfdir=/etc --libexecdir=lib/budgie-screensaver --buildtype plain
}

build() {
    cd "$pkgname"
    ninja -C build
}

package() {
    cd "$pkgname"
    DESTDIR=$pkgdir ninja -C build install
}
