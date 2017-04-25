pkgname=luvi-git
pkgver=2.7.6.r5.g48454bf
pkgrel=1
pkgdesc="A project in-between luv and luvit"
arch=(i686 x86_64)
url="https://github.com/luvit/luvi"
license=('Apache')
groups=()
depends=('gcc-libs')
makedepends=()
optdepends=()
provides=(luvi)
conflicts=(luvi)
source=("git+https://github.com/luvit/luvi.git")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/luvi"
  git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/luvi"
  PREFIX=/usr make regular PREFIX=/usr
  PREFIX=/usr make PREFIX=/usr

  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/local/lib/lua
  install -d "$pkgdir"/usr/local/share/lua
  ln -s /usr/lib/lua/5.1 "$pkgdir"/usr/local/lib/lua/5.1
  ln -s /usr/share/lua/5.1 "$pkgdir"/usr/local/share/lua/5.1
  LUVI_PREFIX="$pkgdir/usr" make install
}
