# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Bastien Dejean <nihilhill@gmail.com>

_pkgname=bspwm
pkgname=${_pkgname}-git
epoch=1
pkgver=0.9.6.r1.g8cac004
pkgrel=1
pkgdesc='A tiling window manager based on binary space partitioning'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:BSD')
depends=('bash' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
optdepends=('sxhkd-git: to define keyboard and pointer bindings' 'bar-aint-recursive: for the example panel' 'xtitle-git: for the example panel' 'sutils-git: for the example panel' 'terminus-font: for the example panel')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

#pkgver() {
#    cd "$srcdir/$_pkgname"
#    git rev-list --count HEAD
#}

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
