# Maintainer: Hoream <hoream@qq.com>
_pkgname="vtracer"
pkgname="${_pkgname}-git"
pkgver=0.6.3.r4.g74f2a04
pkgrel=1
pkgdesc="An open source software to convert raster images (like jpg & png) into vector graphics (svg). It can vectorize graphics and photographs and trace the curves to output compact vector files."
url="https://github.com/visioncortex/vtracer"
license=("MIT")
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("glibc" "gcc-libs")
makedepends=("cargo" "git")
source=(${_pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build(){
 	cd "${srcdir}/${_pkgname}/cmdapp"
    cargo build --release
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${pkg_name}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
