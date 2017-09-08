# Maintrainer: Anatol Pomozov

pkgname=intel-me-tools-git
pkgver=r27.b35da19
pkgrel=1
pkgdesc='Tools for working with Intel ME'
arch=(any)
url='https://github.com/skochinsky/me-tools'
license=(unknown)
depends=(python2)
source=(git+https://github.com/skochinsky/me-tools)
sha1sums=('SKIP')

pkgver() {
  cd me-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd me-tools
  sed -i 's/env python$/env python2/' me_unpack.py
}

package() {
  cd me-tools
  # me_util.py requires Windows, not useful for us
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" me_unpack.py
}
