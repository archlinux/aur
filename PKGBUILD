# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=pf-kernel
_reponame=uksmd
_rev=8368d7e577a78c4ef7330d4d0901e82aae5c3105
pkgver=0.0.0.r13.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://codeberg.org/pf-kernel/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/${_repouser}/${_reponame}/archive/${_rev}.tar.gz)
sha256sums=('b40b87dc62b7017b95d77cd0fca4f4ac6c06d6da1caa6f1b0141d80f579e33da')

build() {
	cd ${_reponame}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${_reponame}

	meson install -C build --destdir "${pkgdir}"
}

