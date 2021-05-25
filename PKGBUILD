# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
pkgname=bspwm-rounded-corners
pkgver=0.9.10
pkgrel=1
pkgdesc="Tiling window manager based on binary space partitioning"
arch=(x86_64)
url="https://github.com/phuhl/bspwm-rounded"
license=(BSD)
depends=(xcb-util xcb-util-wm xcb-util-keysyms)
makedepends=(git)
optdepends=('sxhkd: to define keyboard and pointer bindings'
            'xdo: for the example panel')
conflicts=(bspwm bspwm-git)
source=("https://github.com/phuhl/bspwm-rounded/archive/refs/tags/$pkgver.tar.gz")
install=$pkgname.install
sha256sums=('da72da3ab55af43f6cecef94d8545d9f6ded5c2840475971b0a2d968fa281c3a')

build() {
  cd "$srcdir/bspwm-rounded-$pkgver"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  make PREFIX=/usr
}

package() {
  cd "$srcdir/bspwm-rounded-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
