# Maintainer: Popolon <popolon@popolon.org>

_pkgname=ubgpsuite
pkgname=${_pkgname}-git
pkgver=r74.25707a2
pkgrel=2
pkgdesc="Micro BGP Suite and Utility library"
url="https://codeberg.org/1414codeforge/ubgpsuite.git"
license=("GPL-3.0-or-later" "LGPL-3.0-or-later")
arch=(i686 x86_64 armv7h aarch64 riscv32 riscv64)
depends=('bzip2' 'xz')
makedepends=('git' 'meson' 'ninja')
provides=(upkgbuild)
conflicts=(upkgbuild)
source=("git+https://gitea.it/1414codeforge/ubgpsuite")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${_pkgname}
	meson setup build --buildtype=release --prefix=/usr
}

build() {
	cd ${srcdir}/${_pkgname}/build/
	ninja
}

package() {
	cd ${srcdir}/${_pkgname}/
	DESTDIR="${pkgdir}" meson install -C build
}
