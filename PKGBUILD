# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=gbacklight
pkgver=r5.6c053a2
pkgrel=1
_commit=6c053a2 # corresponds to former version 0.1 plus a README overhaul
pkgdesc="Graphical frontend to xbacklight for adjusting the display brightness"
arch=('i686' 'x86_64')
url="https://github.com/fetchinson/gbacklight"
license=("custom")
depends=('libxrandr' 'gtk2')
makedepends=('git')
source=("git+https://github.com/fetchinson/gbacklight.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
