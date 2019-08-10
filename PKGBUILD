# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=sway-services-git
pkgdesc="Collection of sway and friends systemd unit files"
pkgver=r17.430a8b0
pkgrel=1
arch=(any)
depends=('sway')
makedepends=('meson')
optdepends=('python3: for swayidle.service' 'mako' 'swayidle' 'kanshi')
url="https://github.com/xdbob/sway-services"
source=("git+${url}.git")
license=('MIT')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname%-git}" build
}

package() {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -D -m 0644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
