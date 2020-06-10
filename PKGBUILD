# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

_pkgname=sway-services
pkgname=${_pkgname}-git
pkgdesc="Collection of sway and friends systemd unit files"
pkgver=r25.cd1b01f
pkgrel=1
arch=(any)
depends=('sway')
makedepends=('meson')
optdepends=('python3: for swayidle.service' 'python-yaml: for swayidle.service' 'mako' 'swayidle' 'kanshi')
url="https://github.com/xdbob/sway-services"
source=("git+${url}.git")
license=('MIT')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "$srcdir/${_pkgname}" build
}

package() {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -D -m 0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
