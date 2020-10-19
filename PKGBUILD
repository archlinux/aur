# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=rdrview-git
_pkgname=rdrview
pkgver=20201016.00207dc
pkgrel=1
pkgdesc='Command line tool to extract the main content from a webpage'
url='https://github.com/eafer/rdrview'
license=('custom')
arch=('x86_64')
makedepends=('git')
depends=('curl' 'libxml2' 'libseccomp')
source=('git+https://github.com/eafer/rdrview.git'
        'https://github.com/eafer/rdrview/commit/ff9b0619235db1f1ab12f7d164affd9bc957a891.patch')
sha256sums=('SKIP'
            'SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 -i ../ff9b0619235db1f1ab12f7d164affd9bc957a891.patch
	
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX="${pkgdir}" install
}
