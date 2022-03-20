# Maintainer: Rui Marques <aur@ruimarques.xyz>
# Maintainer: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Eduardo Bart <edub4rt@gmail.com>

pkgname=luajit-openresty
_pkgver=2.1-20220310
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Just-in-time compiler for Lua, OpenResty branch'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/openresty/luajit2"
license=('MIT')
depends=('gcc-libs')
conflicts=('luajit')
provides=('luajit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('fc5b4fa374682a0480697d59e5fcc8f38a7f29c57e562e518507e2789d82fc32')

build() {
  cd "luajit2-$_pkgver"
  make amalg PREFIX=/usr
}

package() {
  cd "luajit2-$_pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
