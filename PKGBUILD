# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=pf-kernel
_reponame=uksmd
_rev=f10f38e3adcaf6175e6c4c1846cad72ae9ab2cf2
pkgver=0.0.0.r15.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://codeberg.org/pf-kernel/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/${_repouser}/${_reponame}/archive/${_rev}.tar.gz)
sha256sums=('dc5acbe4e21923e797b441680a5fa3dd8e436231ae0a55da05a8561e252842f8')

build() {
	cd ${_reponame}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${_reponame}

	meson install -C build --destdir "${pkgdir}"
}

