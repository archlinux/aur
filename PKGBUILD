# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=pf-kernel
_reponame=uksmd
_rev=42934623c422ed8e63708aa6e7827bd83da5c4bb
pkgver=0.0.0.r14.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://codeberg.org/pf-kernel/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/${_repouser}/${_reponame}/archive/${_rev}.tar.gz)
sha256sums=('489ca12a041510259de0bdbfb9ea14c209910ad43c936b3c1578c7095ad30e5c')

build() {
	cd ${_reponame}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${_reponame}

	meson install -C build --destdir "${pkgdir}"
}

