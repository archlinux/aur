# Maintainer: Benno Bielmeier <aur at bbenno dot com>

pkgname=csvq-git
_pkgname=csvq
pkgver=20220704.bd009ac
pkgrel=1
pkgdesc='SQL-like query language for csv'
url='https://mithrandie.github.io/csvq/'
license=(MIT)
arch=(x86_64 i686 arm armv6h armv7h aarch64)
makedepends=(git go)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/mithrandie/csvq')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm 0755 "build/bin/${_pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
