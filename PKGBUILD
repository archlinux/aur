# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_rev=8f0349ec9858b9165e607a263ae0dee004c28ff1
pkgver=0.0.0.r16.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
arch=(x86_64)
depends=(systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_rev}.tar.gz)
sha256sums=('f620de9e2e5a7ba72c4108a7995e247d9352ca112398416c062265dca64d596d')

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

