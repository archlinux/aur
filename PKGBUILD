pkgname=luvi-git
pkgver=2.7.6.r0.g74011c4
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
  pushd $startdir/luvi > /dev/null
  echo `git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'`
  popd > /dev/null
}


package() {
  cd "$srcdir/luvi"
  make tiny
  make

  install -d "$pkgdir"/usr/bin
  LUVI_PREFIX="$pkgdir/usr" make install
}
