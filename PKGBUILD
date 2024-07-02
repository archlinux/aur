# Maintainer: Yazeed Alharthi <yazeed4n@gmail.com>

pkgname=zwm
pkgsrc=${pkgname}-git
pkgver=0.1.3.r2.g6a83b72
pkgrel=1
pkgdesc="Minimal tiling window manager for X11"
arch=('i686' 'x86_64')
url="https://github.com/yazeed1s/${pkgname}"
license=('BSD')
depends=('bash' 'libxcb' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'xcb-util-cursor')
makedepends=('git')
source=("${pkgsrc}::git+https://github.com/yazeed1s/${pkgname}.git")
provides=("${pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${pkgname}")
sha256sums=('SKIP')


pkgver() {
  cd ${pkgsrc}
  git describe --long --tags | sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  	cd ${pkgsrc}
	make all PREFIX=/usr
}

package() {
	cd ${pkgsrc}
	make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pksrc}/LICENSE"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgsrc}/README.md"
}
