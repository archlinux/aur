# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Rui Marques <aur@ruimarques.xyz>
# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Eduardo Bart <edub4rt@gmail.com>

pkgname=luajit-openresty
pkgver=2.1.20260824
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
sha256sums=('d73577495b63373079fe65e89613aee383db4369c22cf5b88a20a57be3d9f33a')

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
