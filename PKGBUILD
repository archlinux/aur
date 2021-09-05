# Maintainer: EndlessEden <eden [at] rose.place>
#Original Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=cpuminer-opt-git
_pkgname=cpuminer-opt
pkgver=3.17.1.r0.g9b905fc
pkgrel=1
pkgdesc="Optimized multi-algo CPU miner - git version"
arch=('x86_64')
url="https://github.com/JayDDee/cpuminer-opt"
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
makedepends=('git')
provides=('cpuminer' 'cpuminer-multi' 'cpuminer-opt')
conflicts=('cpuminer' 'cpuminer-multi' 'cpuminer-opt' 'cpuminer-multi-git')
source=('git+https://github.com/JayDDee/cpuminer-opt')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
