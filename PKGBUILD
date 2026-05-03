# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>

pkgname=ashrwm
_pkgname=ashrwm

pkgver=0.2.0
pkgrel=1
pkgdesc="a minimal yet functional river window manager with tiling/grid layout and more!"
arch=('x86_64')
url="https://github.com/shadowash8/ashrwm"
license=('MIT')
depends=('river' 'janet')
makedepends=('zig' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9313bb253842e86c5014b2942a86d819d77a8435aefece255b4ce979b40b3908')
install="${pkgname}.install"
backup=("etc/ashrwm/config.janet")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
	
    install -Dm755 "zig-out/bin/ashrwm" "${pkgdir}/usr/bin/ashrwm"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "example/config.janet" "${pkgdir}/etc/ashrwm/config.janet"
}
