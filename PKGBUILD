# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=lxi-tools
pkgver=2.8
pkgrel=1
pkgdesc="LXI Tools is a collection of software tools for controlling LXI instruments"
arch=('i686' 'x86_64')
url="https://github.com/lxi/lxi-tools"
license=('BSD-3')
provides=('lxi-tools')
conflicts=('lxi-tools-git')
depends=('liblxi' 'lua53' 'gtk4>=4.5.0' 'gtksourceview5>=5.3.3')
makedepends=('meson')
source=("https://github.com/lxi/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('574bf5566517c89d9274a331971fa6eefc6beb48d0882b65105299fd6abbc7c4')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson --prefix=/usr --buildtype=plain --wrap-mode=nofallback . build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:

