# Maintainer: Philipp Uhl <git@ph-uhl.com>

pkgname=bspwm-rounded-corners-git
pkgver=0.9.10.r41.ga510c36
pkgrel=1
pkgdesc="A tiling window manager based on binary space partitioning with rounded corners"
url="https://github.com/phuhl/bspwm-rounded"
arch=('x86_64')
license=('custom:BSD')
depends=('bash' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
optdepends=('sxhkd-git: to define keyboard and pointer bindings'
	    'bar-aint-recursive: for the example panel'
	    'xtitle-git: for the example panel'
	    'sutils-git: for the example panel'
	    'terminus-font: for the example panel'
	    'python3: for some scripting examples')
source=("$pkgname::git+https://github.com/phuhl/bspwm-rounded.git#branch=round_corners")
md5sums=('SKIP')
provides=("bspwm")
conflicts=("bspwm")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}


build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
