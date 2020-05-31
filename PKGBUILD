# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro at gmail dot com>

pkgname=python-pynvim-git
pkgver=0.4.1
pkgrel=1
pkgdesc='Python client for Neovim (git version)'
url='https://github.com/neovim/pynvim'
arch=('any')
license=('Apache')
depends=('python' 'python-msgpack' 'python-greenlet')
provides=('python-neovim')
makedepends=('python-setuptools')
provides=('python-pynvim')
conflicts=('python-pynvim')
source=("$pkgname::git+https://github.com/neovim/pynvim.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(python setup.py --version | tail -n1)"
}

prepare() {
  sed -i "s/msgpack-python/msgpack/g" $pkgname/setup.py
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}" --skip-build
}

# vim:set sw=2 sts=2 et:
