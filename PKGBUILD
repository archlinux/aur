# Maintainer: Jake Stanger <mail@jstanger.dev>

pkgname=ironbar-git
pkgver=0.16.1.r121.g67426bd
pkgrel=1
makedepends=('rust' 'cargo' 'git' 'openssl' 'libpulse' 'luajit')
depends=('gtk3' 'gtk-layer-shell' 'lua51-lgi' 'libdbusmenu-glib' 'libinput' 'libdbusmenu-gtk3')
provides=('ironbar')
conflicts=('ironbar')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Customisable wlroots/sway bar written in rust"
license=('MIT')
source=('git+https://github.com/JakeStanger/ironbar')
url='https://ironb.ar'
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/ironbar"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

build() {
    cd "$srcdir/ironbar"
    cargo build --release --locked
}

package() {
  install -Dm 755 "$srcdir/ironbar/target/release/ironbar" "$pkgdir/usr/bin/ironbar"
}
