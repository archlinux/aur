# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: CleanMachine1

# Same as the official package however doesn't depend on python-shtab

pkgname=tldr-python-client-no-shtab
pkgver=3.0.0
pkgrel=1
pkgdesc="Command line client for tldr, a collection of simplified and community-driven man pages."
arch=('any')
url="https://github.com/tldr-pages/tldr-python-client"
license=('MIT')
depends=('python-colorama' 'python-termcolor')
makedepends=('python-setuptools' 'python-sphinx-argparse')
checkdepends=('python-pytest')
source=("https://github.com/tldr-pages/tldr-python-client/archive/$pkgver/tldr-$pkgver.tar.gz")
sha512sums=('34d7698960e45b837e40e3208642fdd93e4a4214f16d8f58b0f5dd7c9ffa17eb19e1cf92d7af406189bb91ed1356b6215667d06814a406dba0e773be1837131e')

build() {
  cd tldr-python-client-$pkgver
  python setup.py build
}

check() {
  cd tldr-python-client-$pkgver
  python -m pytest
}

package() {
  cd tldr-python-client-$pkgver
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/tldr/
}
