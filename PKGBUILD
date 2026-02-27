# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Rui Marques <aur@ruimarques.xyz>
# Contributor: Fabio Loli <fabio.loli@disroot.org>
# Contributor: Eduardo Bart <edub4rt@gmail.com>

pkgname=luajit-openresty
pkgver=2.1.20260227
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
sha256sums=('5a0df315f88fea733f1f4296d119f0816eb395d1da39d49b4b1758d44d7dee31')

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
