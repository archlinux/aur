# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-screensaver-git
pkgver=5.0.2.r1.g57dfb33
pkgrel=1
pkgdesc="Budgie's fork of GNOME's legacy screensaver - latest git"
arch=('x86_64')
license=('GPL')
url="https://github.com/BuddiesOfBudgie/budgie-screensaver"
depends=('budgie-desktop' 'dbus-glib' 'libgnomekbd')
makedepends=('meson' 'git' 'intltool' 'gnome-common')
optdepends=('gnome-backgrounds: default background')
provides=('gnome-screensaver' 'budgie-screensaver')
conflicts=('gnome-screensaver' 'budgie-screensaver')
source=("$pkgname"::"git+https://github.com/BuddiesOfBudgie/budgie-screensaver.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
}

build() {
    arch-meson "$pkgname" build --libexecdir="lib/budgie-screensaver"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
