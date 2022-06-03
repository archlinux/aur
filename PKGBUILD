# Maintainer: Ralph Zhou <1694487365@qq.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=q5go-git
_pkgname=q5go
pkgver=20220603.077f0c1
pkgrel=1
pkgdesc='Everyday SGF editor for Go players'
url='https://github.com/bernds/q5go'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
makedepends=('git')
depends=('qt5-multimedia' 'qt5-svg')
source=("git+https://github.com/bernds/q5go.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}/src"
	qmake-qt5 q5go.pro PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}/src"
	make INSTALL_ROOT="${pkgdir}" install
}
