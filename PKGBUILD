# Maintainer: Lex Childs <lexchilds@gmail.com>
pkgname=leftwm-git
pkgver=c886a92
pkgrel=1
epoch=1
pkgdesc="Leftwm - A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
depends=()
makedepends=('rustup' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
provides=('leftwm')
conflicts=('leftwm')
source=("${pkgname}::git+https://github.com/leftwm/leftwm.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mv "target/release/leftwm" "$pkgdir/usr/bin"
  mv "target/release/leftwm-worker" "$pkgdir/usr/bin"
  mv "target/release/leftwm-state" "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/leftwm"
  cp -R "$srcdir/$pkgname/themes" "$pkgdir/usr/share/leftwm"

  mkdir -p "$pkgdir/usr/share/xsessions"
  cp "$srcdir/$pkgname/leftwm.desktop" "$pkgdir/usr/share/xsessions"
}

