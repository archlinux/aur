# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Rui Marques <aur@ruimarques.xyz>
# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Eduardo Bart <edub4rt@gmail.com>

pkgname=luajit-openresty
pkgver=2.1.20250529
_pkgver="${pkgver%.*}-${pkgver//*.}"
pkgrel=1
pkgdesc='Just-in-time compiler for Lua, OpenResty fork'
arch=(i686 x86_64 aarch64)
url="https://github.com/openresty/luajit2"
license=(MIT)
depends=(gcc-libs)
conflicts=(luajit)
provides=("luajit=$pkgver")
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$_pkgver/$_archive.tar.gz")
sha256sums=('a3f6f5ead9fc69603e51c66877614e6b5e93332d552f35d08f932447357ed593')

build() {
  cd "luajit2-$_pkgver"
  # Avoid early stripping
  make amalg PREFIX=/usr BUILDMODE=dynamic TARGET_STRIP=" @:"
}

package() {
  cd "luajit2-$_pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
