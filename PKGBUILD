# Maintainer: Manuel Mendez <mmendez534@gmail.com>

pkgname=pangoterm-bzr
pkgver=r587
pkgrel=1
pkgdesc='A GTK/Pango-based terminal that uses libvterm to provide terminal emulation.'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/pangoterm'
license=('MIT')
makedepends=('bzr')
provides=("${pkgname%-bzr}")
conflicts=("${pkgname%-bzr}")
install=('pangoterm.install')
source=("bzr+http://bazaar.leonerd.org.uk/code/pangoterm/")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-bzr}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/${pkgname%-bzr}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname%-bzr}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bzr}/LICENSE"
  install -Dm644 pangoterm.cfg "${pkgdir}/usr/share/${pkgname%-bzr}/pangoterm.cfg"
}

# vim:set sw=2 sts=2 et:
