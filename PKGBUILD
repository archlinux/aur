# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
# Maintainer: Campbell Jones <dev at serebit dot com>

pkgname=budgie-desktop-git
pkgver=10.5.3.r56.gf9cfa8e6
pkgrel=1
pkgdesc="A feature-rich, modern desktop - latest git"
arch=('x86_64')
url="https://github.com/BuddiesOfBudgie/budgie-desktop"
license=('GPL2' 'LGPL2.1')
depends=('gnome-bluetooth' 'gnome-menus' 'gnome-session' 'gnome-themes-standard' 'libpeas' 'libwnck3'
         'mutter' 'accountsservice' 'sassc' 'ibus')
makedepends=('meson' 'git' 'gobject-introspection' 'intltool' 'vala' 'gtk-doc')
optdepends=('gnome-backgrounds: Default background'
            'gnome-control-center: System settings'
            'gnome-screensaver: Lock screen'
            'network-manager-applet: Network management')
provides=('budgie-desktop')
conflicts=('budgie-desktop')
source=("$pkgname"::'git+https://github.com/BuddiesOfBudgie/budgie-desktop.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's/^v([^-]*)-([^-]*)-/\1.r\2./'
}

prepare() {
    cd "$pkgname"
    git submodule update --init
}

build() {
    cd "$pkgname"
    meson build --prefix=/usr --sysconfdir=/etc --buildtype plain
    ninja -C build
}

package() {
    cd "$pkgname"
    DESTDIR=$pkgdir ninja -C build install
}
