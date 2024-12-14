# Maintainer: Yazeed Alharthi <yazeed4n@gmail.com>

_pkgname_=zwm
pkgname=${_pkgname_}-git
pkgver=0.1.13
pkgrel=1
pkgdesc="Minimal tiling window manager for X11"
arch=('i686' 'x86_64')
url="https://github.com/yazeed1s/${_pkgname_}"
license=('BSD')
depends=('bash' 'libxcb' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'xcb-util-cursor')
makedepends=('git')
source=("${pkgname}::git+https://github.com/yazeed1s/${_pkgname_}.git")
provides=("${_pkgname_}")
conflicts=("${_pkgname_}")
sha256sums=('SKIP')


#pkgver() {
#  cd ${pkgname}
#  git describe --long --tags | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
#}

build() {
  	cd ${pkgname}
	make all PREFIX=/usr
}

package() {
	cd ${pkgname}
	make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
