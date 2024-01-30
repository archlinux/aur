# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pion-ng
pkgname=$_pkgname-git
pkgver=5.0.8.r1.g7e8174e
pkgrel=1
pkgdesc="Pion Network Library"
arch=(x86_64)
url="https://github.com/rimmartin/pion-ng"
license=('BSL-1.0')
depends=('boost-libs' 'openssl')
makedepends=('git' 'boost')
provides=("$_pkgname")
conflicts=("${provides}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's|-|.r|;s|-|.|'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}
