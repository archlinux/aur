pkgname=syzkaller-git
pkgver=r5884.79264ae39
pkgrel=1
pkgdesc='a distributed, unsupervised, coverage-guided Linux syscall fuzzer'
arch=(x86_64 i686)
url='https://github.com/google/syzkaller'
license=(apache)
depends=(go)
makedepends=(git)
source=(git+https://github.com/google/syzkaller)
sha256sums=('SKIP')

pkgver() {
  cd syzkaller
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd syzkaller
  make all -j1
}

package() {
  cd syzkaller

  install -dm755 "$pkgdir"/usr/bin
  install -m755 bin/linux_amd64/syz-* "$pkgdir"/usr/bin/
  install -m755 bin/syz-* "$pkgdir"/usr/bin/
}
