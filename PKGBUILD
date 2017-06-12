# Maintainer: Alex O'Neill <me@aoneill.me>
_pkgname=tzme
pkgname=${_pkgname}-git
pkgver=r5.33f19a7
pkgrel=1
pkgdesc="Timezone updates based on location"
arch=('any')
url="https://github.com/alexoneill/tzme"
license=('MIT')
depends=('curl' 'libsystemd' 'libxml2')
makedepends=('git')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/alexoneill/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make PREFIX="$pkgdir/usr" install
}
