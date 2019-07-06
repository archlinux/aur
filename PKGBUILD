# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Bastien Dejean <baskerville@lavabit.com>

_pkgname=xtitle
pkgname=${_pkgname}-git
pkgver=46
pkgrel=1
pkgdesc='Outputs X window titles'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${_pkgname}"
license=('custom:Unlicense')
depends=('libxcb' 'xcb-util-wm')
makedepends=('git' 'xcb-util')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/baskerville/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
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
