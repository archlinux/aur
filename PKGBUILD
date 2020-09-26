# Contributor: Pascal Ernster <aur at hardfalcon dot net>
# Contributor: Alexandros Theodotou <alex at alextee dot org>

_pkgname="libcyaml"
pkgname="${_pkgname}-git"
pkgver=1.1.0+10+gc95c7bc
pkgrel=1
pkgdesc="C library for reading and writing YAML"
arch=('x86_64')
url="https://github.com/tlsa/libcyaml"
license=('ISC')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('libyaml')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/tlsa/${_pkgname}.git")
sha512sums=('SKIP')

pkgver () {
	cd "${srcdir}/${_pkgname}"
	git tag "1.1.0" "7e1cd870e1ec92365d37b2081a6b29a55096e999" # Fix for upstream repo lacking versioning tags
	git describe --long --tags | sed 's|-|+|g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install --target-directory="${pkgdir}/usr/share/licenses/${pkgname}" -D "LICENSE"
}
