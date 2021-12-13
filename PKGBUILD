# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=gedit-plugin-grammalecte
_pluginname=gedit-grammalecte
pkgver=v0.1
pkgrel=2
pkgdesc="Un greffon pour intégrer Grammalecte dans gedit."
url="https://github.com/sveyret/gedit-grammalecte"
arch=('any')
license=(GPL3)
depends=(gedit grammalecte)
makedepends=(git python)
_commit=2a0ed5deefaf85045f665c677d0005d1efa701af  # tags/0.1^0
source=("git+https://github.com/sveyret/gedit-grammalecte#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $_pluginname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pluginname
  make
}

check() {
  cd $_pluginname
  make test
}

package() {
  cd $_pluginname
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
