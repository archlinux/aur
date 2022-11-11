# Maintainer: Nicolas Goy <me@kuon.ch>

pkgname=openswitcher-git
pkgver=0.8.0
pkgrel=1
pkgdesc="BlackMagic Atem control software implementation"
arch=("any")
url="https://git.sr.ht/~martijnbraam/pyatem"
license=('GPL3')
groups=()
depends=('python' 'python-pyusb')
makedepends=('git' 'meson')
source=("git+https://git.sr.ht/~martijnbraam/pyatem")
md5sums=('SKIP')

build() {
  cd $srcdir/pyatem
  python setup.py build
  meson build --prefix /usr
  meson compile -C build
}

package() {
  cd $srcdir/pyatem
  python setup.py install --root "$pkgdir"
  DESTDIR=$pkgdir meson install -C build
}
