# python2-pynvim

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

# Contributor: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python2-pynvim
_pkgname=${pkgname#*-}
pkgver=0.4.1
pkgrel=3
pkgdesc='Python client for Neovim.'
arch=('any')
url='https://github.com/neovim/pynvim'
license=('Apache')
depends=('python2' 'python2-msgpack' 'python2-greenlet' 'python2-trollius')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-runner')
provides=('python2-neovim')
replaces=('python2-neovim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/python-client/archive/$pkgver.tar.gz")
sha256sums=('132ea5c226399aed45a959f1d8efe8cdd89a769a672534722760a9a67b06dfa0')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py pytest
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
}

