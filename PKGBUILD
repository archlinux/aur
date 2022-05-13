# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=post-factum
_reponame=uksmd
_rev=e9b06f4f8e982d2d0cd1830c7dd6803db56b7e72
pkgver=0.0.0.r12.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN systemd procps-ng libcap-ng)
makedepends=(meson)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_repouser}/${_reponame}/-/archive/${_rev}/${_reponame}-${_rev}.tar.gz)
sha256sums=('cee4d81ae2efaa705ffda079f1892e091378bec122718df70fd754ffefb4b7e8')

build() {
	cd ${_reponame}-${_rev}

	arch-meson . build

	meson compile -C build
}

package() {
	cd ${_reponame}-${_rev}

	meson install -C build --destdir "${pkgdir}"
}

