# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
_pkgname=qt6gtk2
pkgname=$_pkgname-git
pkgver=0.1+2+g9a5610f
pkgrel=1
pkgdesc='GTK+2.0 integration plugins for Qt6'
arch=(x86_64)
url='https://github.com/trialuser02/qt6gtk2'
license=(BSD)
conflicts=($_pkgname)
depends=(qt6-svg qt6-base)
makedepends=(qt6-tools git)
source=("${_pkgname}-$pkgver::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname-$pkgver
	git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname-$pkgver
  /usr/lib/qt6/bin/qmake PREFIX=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
