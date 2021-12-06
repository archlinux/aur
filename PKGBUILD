# Maintainer: Lex Childs <lexchilds@gmail.com>
pkgname=leftwm
pkgver=0.2.10
pkgrel=1
epoch=1
pkgdesc="Leftwm - A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
source=("${pkgname}::git+https://github.com/leftwm/leftwm.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname/target/release
  install -Dm755 leftwm leftwm-worker leftwm-state leftwm-check leftwm-command -t "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/leftwm
  cp -R "$srcdir"/$pkgname/themes "$pkgdir"/usr/share/leftwm

  install -Dm644 "$srcdir"/$pkgname/leftwm.desktop "$pkgdir"/usr/share/xsessions/leftwm.desktop
}

