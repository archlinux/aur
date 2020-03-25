# Maintainer: xXR01I1Xx <xxr01i1xx@tuta.io>
pkgname=bspwm-rounded-corners
pkgver=0.9.9
pkgrel=1
pkgdesc="Tiling window manager based on binary space partitioning"
arch=(x86_64)
url="https://github.com/dylanaraps/bspwm"
license=(BSD)
depends=(xcb-util xcb-util-wm xcb-util-keysyms)
makedepends=(git)
optdepends=('sxhkd: to define keyboard and pointer bindings'
            'xdo: for the example panel')
conflicts=(bspwm bspwm-git)
source=("git+https://github.com/baskerville/bspwm#tag=$pkgver"
        'rounded-corners.patch')
install=$pkgname.install
sha256sums=('SKIP'
            '7c5d39d8f0fed0045e87cee3aaf3fcd4f1d87da08491a7f2e816b85976745ca0')

prepare() {
  cd $srcdir/bspwm
  echo "Applying patch"
  git apply $srcdir/rounded-corners.patch
}

build() {
  make -C "$srcdir/bspwm" PREFIX=/usr
}

package() {
  cd $srcdir/bspwm
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
