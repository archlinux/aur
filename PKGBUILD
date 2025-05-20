# Maintainer: El Bachir <bachiralfa@gmail.com>

pkgname=sxwm-git
_pkgname=sxwm
pkgver=r147.ae590dc
pkgrel=1
pkgdesc="Tiling window managers don't have to be difficult"
arch=('i686' 'x86_64')
url="https://github.com/uint23/sxwm"
license=('MIT')
depends=('libx11' 'libxinerama' 'libxcursor')
makedepends=('gcc' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/uint23/sxwm.git)
sha256sums=('SKIP')

pkgver() {
cd "$_pkgname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}



build() {
	cd "$srcdir/$_pkgname"
	make LDFLAGS="-lX11 -lXinerama -lXcursor"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 sxwm "$pkgdir/usr/bin/sxwm"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
