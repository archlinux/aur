# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=xpipe-git
pkgver=r11.60b0aec
pkgrel=1
pkgdesc="split input and feed it into the given utility"
arch=('any')
url='https://github.com/jschauma/xpipe.git'
license=('BSD')
makedepends=('git')
source=("git+https://github.com/jschauma/xpipe.git")
sha256sums=('SKIP')
conflicts=('xpipe')
provides=('xpipe')

pkgver() {
  cd xpipe
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd xpipe
  make test
}

build() {
  cd xpipe
  make
}

package() {
  cd xpipe
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -d "${pkgdir}/usr/share/man/man1"
  install -m755 xpipe "${pkgdir}/usr/bin/"
  install -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 doc/xpipe.1 "${pkgdir}/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
