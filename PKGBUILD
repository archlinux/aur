# Maintainer: mars <gzhqyz at gmail dot com>
# Contributor: Daniel M. Capella <polyzen at archlinux dot org>
# Contributor: Darshit Shah <darnir at gmail dot com>

pkgname=vint-git
pkgver=0.4a4.dev8+g5b05880
pkgrel=1
pkgdesc='Lint tool for Vim script Language (git version)'
arch=('any')
url=https://github.com/Vimjas/vint
license=('MIT')
depends=('python-wheel' 'python-ansicolor' 'python-chardet' 'python-setuptools' 'python-yaml')
checkdepends=('python-pytest')
provides=('vint')
conflicts=('python-vint' 'vint')
source=("$pkgname::git+https://github.com/Vimjas/vint.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(python setup.py --version | tail -n1)"
}

build() {
  cd $pkgname
  python setup.py build
}

check() {
  cd $pkgname
  pytest
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
