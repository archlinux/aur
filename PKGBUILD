# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=way-cooler
pkgver=0.8.1
pkgrel=1
epoch=1
pkgdesc="Customizeable Wayland compositor written in Rust (upstream abandoned)"
arch=('i686' 'x86_64')
url='https://way-cooler.org/'
license=('MIT')
depends=('wlc')
makedepends=('cargo' 'rust' 'git' 'cairo')
optdepends=('weston: default terminal emulator'
            'dmenu: default launcher'
            'way-cooler-bg: draws a background for Way Cooler')
backup=('etc/way-cooler/init.lua')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c95e5ac960eacf79a1267aa36cb3a94d6e023d0389845424b782e5b65cc56346')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"

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
