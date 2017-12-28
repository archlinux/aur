# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=way-cooler
pkgver=0.7.0
pkgrel=2
epoch=1
pkgdesc="Customizeable Wayland compositor written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/way-cooler/way-cooler"
license=('MIT')
depends=('wlc')
makedepends=('cargo' 'rust' 'git' 'cairo')
optdepends=('weston: default terminal emulator'
            'dmenu: default launcher'
            'way-cooler-bg: draws a background for Way Cooler')
backup=('etc/way-cooler/init.lua')
source=("${pkgname}::git+https://github.com/way-cooler/way-cooler.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  #cargo install way-cooler --root "$pkgdir"
  #mkdir "$pkgdir/usr"
  #mv "$pkgdir/bin" "$pkgdir/usr"

  mkdir -p "$pkgdir/usr/bin"
  mv "target/release/way-cooler" "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/etc/way-cooler"
  cp "$srcdir/$pkgname/config/init.lua" "$pkgdir/etc/way-cooler"

  mkdir -p "$pkgdir/usr/share/wayland-sessions"
  cp "$srcdir/$pkgname/way-cooler.desktop" "$pkgdir/usr/share/wayland-sessions"
}

# vim:set ts=2 sw=2 et:
