# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
_pkgname=qt6ct
pkgname=$_pkgname-git
pkgver=0.2
pkgrel=1
pkgdesc='Qt6 Configuration Tool'
arch=(x86_64)
url='https://github.com/trialuser02/qt6ct'
license=(GPL2)
depends=(qt6-svg qt6-base gtk2)
makedepends=(qt6-tools git)
source=("${_pkgname}-$pkgver::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
