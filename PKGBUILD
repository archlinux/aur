# Maintainer: Popolon <popolon@popolon.org>

_pkgname=ubgpsuite
pkgname=${_pkgname}-git
pkgver=r67.f214c5e
pkgrel=2
pkgdesc="Micro BGP Suite and Utility library"
url="https://git.doublefourteen.io/bgp/ubgpsuite"
license=("GPL3" "GPL lesser 3")
arch=(i686 x86_64 armv7h aarch64 riscv32 riscv64)
depends=('bzip2' 'xz')
makedepends=('git' 'meson' 'ninja')
provides=(upkgbuild)
conflicts=(upkgbuild)
source=("git+https://git.doublefourteen.io/bgp/ubgpsuite.git")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${_pkgname}
	meson build --buildtype=release --prefix=/usr
}

build() {
	cd ${srcdir}/${_pkgname}/build/
	ninja
}

package() {
	cd ${srcdir}/${_pkgname}/
	DESTDIR="${pkgdir}" meson install -C build
}
