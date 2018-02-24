# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=cpuminer-multi-allium-git
_pkgname=cpuminer-multi
pkgver=1.0.0.allium.r0.gf502477
pkgrel=4
pkgdesc="Multi-threaded CPU miner with Allium (Garlicoin) support - git version"
arch=('x86_64')
url="https://github.com/GarlicoinOrg/cpuminer-multi"
license=('GPL')
depends=('curl' 'jansson' 'openssl')
makedepends=('git')
provides=('cpuminer' 'cpuminer-multi' 'cpuminer-multi-allium')
conflicts=('cpuminer' 'cpuminer-multi' 'cpuminer-multi-allium' 'cpuminer-multi-git')
source=('git+https://github.com/GarlicoinOrg/cpuminer-multi')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
