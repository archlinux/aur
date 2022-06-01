# Maintainer: Ralph Zhou <1694487365@qq.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=q5go-git
_pkgname=q5go
pkgver=20220508.b1b78a7
pkgrel=2
pkgdesc='Everyday SGF editor for Go players'
url='https://github.com/bernds/q5go'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
makedepends=('git')
depends=('qt5-multimedia' 'qt5-svg')
source=("git+https://github.com/bernds/q5go.git"
        'https://github.com/bernds/q5go/pull/66/commits/64c04f76ea94a453d66d80ce903c9988b70b2c9f.patch')
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
	patch -p1 -i ../64c04f76ea94a453d66d80ce903c9988b70b2c9f.patch
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
