# Maintainer: Maarten de Boer <maarten@cloudstek.nl>
pkgname=bspwm-rounded-corners
pkgver=0.9.10
pkgrel=2
pkgdesc="Tiling window manager based on binary space partitioning"
arch=(x86_64)
url="https://github.com/phuhl/bspwm-rounded"
license=(BSD)
depends=(xcb-util xcb-util-wm xcb-util-keysyms)
makedepends=(git)
optdepends=('sxhkd: to define keyboard and pointer bindings'
            'xdo: for the example panel')
conflicts=(bspwm bspwm-git)
install=$pkgname.install

_git_ref=98e96427aa4af1d7b0c2f0e45a5ef8bbd6407a0b

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phuhl/bspwm-rounded/archive/${_git_ref}.tar.gz")

sha256sums=('76b8de33faf54633f315f246b48328cd9011ec449569e3e9ee7186b1b1834bb4')

build() {
  cd "$srcdir/bspwm-rounded-${_git_ref}"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  make PREFIX=/usr
}

package() {
  cd "$srcdir/bspwm-rounded-${_git_ref}"

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
