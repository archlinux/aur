# Maintaner: Evan Overman <evanrileyoverman@gmail.com>

pkgname=mangal-git
_pkgname=mangal
pkgver=4.0.6.r4.g165f7ca
pkgrel=1
pkgdesc='The most advanced (yet simple) cli manga downloader in the entire universe!'
url='https://github.com/metafates/mangal'
makedepends=('git' 'go' 'make')
license=('MIT')
arch=('any')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')
provides=('mangal')
conflicts=('mangal' 'mangal-bin')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make build
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p ${pkgdir}/usr/bin/
	mv mangal ${pkgdir}/usr/bin/
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
