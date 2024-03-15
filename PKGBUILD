pkgname=kcbench
pkgver=0.9.10
pkgrel=1
pkgdesc="Linux kernel compile benchmark"
arch=(any)
url="https://gitlab.com/knurd42/kcbench"
license=(MIT)
depends=(
  bc binutils bison curl flex gcc libelf make openssl perl pkg-config time
)
makedepends=(git)
_commit=901a4f659d6df3cdf1d5e5db21010e5d170a9386
source=("git+https://gitlab.com/knurd42/kcbench.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd kcbench
  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

package() {
  cd kcbench
  make DESTDIR="$pkgdir" PREFIX=/usr install
  ln -nsf kcbench "$pkgdir"/usr/bin/kcbenchrate
}

# vim: ts=2:sw=2:et:
