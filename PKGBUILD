# Maintrainer: Anatol Pomozov

pkgname=intel-me-tools-git
pkgver=r8.fc0b1c3
pkgrel=1
pkgdesc='Tools for working with Intel ME'
arch=(any)
url='https://github.com/skochinsky/me-tools'
license=(unknown)
depends=(python2)
source=(linux_fixes.patch
        git+https://github.com/skochinsky/me-tools)
md5sums=('5b282b95bef7692fded0558a98342f0e'
         'SKIP')

pkgver() {
  cd me-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd me-tools
  patch -p1 < ../linux_fixes.patch
}

package() {
  cd me-tools
  # me_util.py requires Windows, not useful for us
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" me_unpack.py
}
