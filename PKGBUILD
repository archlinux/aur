# Maintainer: Balazs Vinarz <vinibali1@gmail.com>

pkgname=chibicc-git
pkgver=$(date +"%Y%m%d")
pkgrel=1
pkgdesc='Small C11 compiler'
arch=(i686 x86_64 armv7h aarch64)
url='https://github.com/rui314/chibicc'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(https://github.com/rui314/chibicc/archive/main.zip
        chibicc-include-path.patch)
sha256sums=('SKIP' 'cf4252b2809360022a36a62b190b80940c771c5c1439ced4bbd3bcd04d7244ad')

prepare() {
  cd "${srcdir}"/"chibicc-main"
  patch -Np1 -i "$srcdir/chibicc-include-path.patch"
}

build() {
  cd "${srcdir}"/"chibicc-main"
  make
}

check() {
  cd "${srcdir}"/"chibicc-main"
  make test
}

package() {
  cd "${srcdir}"/"chibicc-main"

  install -Dm755 chibicc "$pkgdir/usr/bin/chibicc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/lib/chibicc/include"
  install -Dm755 include/* "$pkgdir/usr/lib/chibicc/include"
}
