# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=way-cooler-git
pkgver=0.3.r3.gc5fb6f0
pkgrel=2
epoch=1
pkgdesc="Customizeable Wayland compositor written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Immington-Industries/way-cooler"
license=('MIT')
depends=('wlc')
makedepends=('cargo' 'rust' 'git')
provides=('way-cooler')
conflicts=('way-cooler')
source=("${pkgname}::git+https://github.com/Immington-Industries/way-cooler.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  rm Cargo.lock
}

package() {
  cd "$srcdir/$pkgname"
  cargo install way-cooler --root "$pkgdir"
  mkdir "$pkgdir/usr"
  mv "$pkgdir/bin" "$pkgdir/usr"

  mkdir -p "$pkgdir/etc/way-cooler"
  cp "$srcdir/$pkgname/config/init.lua" "$pkgdir/etc/way-cooler"
}

# vim:set ts=2 sw=2 et:
