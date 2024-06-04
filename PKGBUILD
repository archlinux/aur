# Maintainer: Caleb Marshall <n0tacyb0rg at proton dot me>
# Contributor: Rihards Skuja <rhssk at posteo eu>

_pkgname=kpeoplevcard
pkgname=$_pkgname-git
pkgver=0.1.r164.g6d9178d
pkgrel=1
pkgdesc='Expose VCard contacts to KPeople'
arch=(x86_64)
url='https://kde.org'
license=(GPL)
depends=(kpeople5 kcontacts5)
makedepends=(git extra-cmake-modules)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://invent.kde.org/pim/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_pkgname -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
