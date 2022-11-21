# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Roger Duran <rogerduran@gmail.com>

pkgname=python38-xcffib
pkgver=0.12.1
pkgrel=1
pkgdesc="Python3 drop in replacement for xpyb, an XCB python binding"
arch=('any')
url="https://pypi.python.org/pypi/xcffib"
license=('Apache')
depends=('python38-six' 'python38-cffi' 'libxcb')
makedepends=('python38-setuptools' 'haskell-xcffib')
checkdepends=('python38-pytest' 'xorg-server-xvfb' 'xorg-xeyes')
source=("https://github.com/tych0/xcffib/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ff3650d484863921c0ce00bf1ce5d4c43fc919f3f54f1cca06d93a33a183682434294a6db45f113d794316054c4884427519a1c24f9c18f7ced1b1d74695bbd7')

build() {
  cd xcffib-$pkgver
  make xcffib GEN=xcffibgen CABAL=true
  python3.8 setup.py build
}

check() {
  cd xcffib-$pkgver
  xvfb-run pytest
}

package() {
  cd xcffib-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}
