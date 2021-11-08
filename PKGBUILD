# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Wouter Wijsman <wwijsman@live.nl>
pkgname=minigalaxy
pkgver=1.1.0
pkgrel=2
pkgdesc="A simple GOG client for Linux"
arch=('any')
url="https://sharkwouter.github.io/minigalaxy"
license=('GPL3' 'CC-BY-3.0')
depends=('gtk3' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('python-setuptools')
optdepends=('dosbox: Use the system DOSBox installation'
            'innoextract: Extract Windows installers'
            'scummvm: Use the system ScummVM installation'
            'wine: Install Windows games')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sharkwouter/minigalaxy/archive/$pkgver.tar.gz")
sha256sums=('581e7abfb4af0c01d795dc57a93b1305644d8bdd11ecb533bb2787f85b4bc992')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 THIRD-PARTY-LICENSES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
