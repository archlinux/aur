# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_rev=779017a3dc5f5951811bffdae6f3634e5cba91fa
pkgver=0.0.0.r19.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_rev}.tar.gz)
sha256sums=('0b779b4ed14f4016aabaa1385489e6e3538803bfb3883024790d5b941682ebe2')

build() {
	cd ${pkgname}

	arch-meson . build

	meson compile -C build
}

package() {
	depends+=(UKSMD-BUILTIN)

	cd ${pkgname}

	meson install -C build --destdir "${pkgdir}"
}

