# Maintainer: Lex Childs <lexchilds@gmail.com>
pkgname=leftwm-git
pkgver=0.2.5.r5.ga1d2872
pkgrel=1
epoch=2
pkgdesc="Leftwm - A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
makedepends=('cargo' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
provides=('leftwm')
conflicts=('leftwm')
source=("${pkgname}::git+https://github.com/leftwm/leftwm.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  cargo build --release
}

pkgver() {
  cd $pkgname
  git describe --tags | sed 's+-+.r+' | tr - . 
}

package() {
  cd $pkgname/target/release
  install -Dm755 leftwm leftwm-worker leftwm-state -t "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/leftwm
  cp -R "$srcdir"/$pkgname/themes "$pkgdir"/usr/share/leftwm

  install -Dm644 "$srcdir"/$pkgname/leftwm.desktop "$pkgdir"/usr/share/xsessions
}
