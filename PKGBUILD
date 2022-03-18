pkgname=kcbench
pkgver=0.9.5
pkgrel=1
pkgdesc="Linux kernel compile benchmark"
arch=(any)
url="https://gitlab.com/knurd42/kcbench"
depends=(
  bc binutils bison curl flex gcc libelf make openssl perl pkg-config time
)
makedepends=(git)
_commit=400de84e91e0042e81579cc1a15b982b3f875e23
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
