# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=slcl
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple and lightweight cloud"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/slcl"
license=('GPL3')
depends=('openssl' 'cjson' 'dynstr' 'libweb')
optdepends=('jq: usergen script')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-rc4.tar.gz")
sha512sums=('8d21bb871cf707d5a0054f747111006f5e7bbf5a6def717bdd0458e836674593fed2df9987da1b6d8950ebb87ef5a9bdf149c1d19ae5d116ec4c24d86d15b0c5')

build() {
  cd "$pkgname"

  ./configure
  make
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "slcl" "$pkgdir/usr/bin/"
  install -Dm755 "usergen" "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/usr/lib"

  cd "doc"

  make PREFIX="$pkgdir" install
}

