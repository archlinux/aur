pkgname=jitterbugpair-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Launch JIT enabled iOS app with a second iOS device."
arch=('x86_64')
url="https://github.com/osy/Jitterbug/"
license=('Apache-2.0')
depends=('libplist' 'libp11-kit')
makedepends=('patchelf')
source=("https://github.com/osy/Jitterbug/releases/download/v${pkgver}/jitterbugpair-linux.zip")
sha256sums=('d3bbefe05681930cf2f562cada0357d48e2ca096231e0dff5448b550317eb05c')

package() {
  cd "$srcdir"
  unzip -o "jitterbugpair-linux.zip"

  patchelf --remove-needed libplist.so.3 ./jitterbugpair
  patchelf --add-needed libplist-2.0.so ./jitterbugpair

  install -Dm755 jitterbugpair "$pkgdir/usr/bin/jitterbugpair"
}
