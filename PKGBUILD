# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-python-bitcoinlib-git
pkgver=20150420
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python')
makedepends=('git' 'python-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/petertodd/python-bitcoinlib)
sha256sums=('SKIP')
provides=('python-python-bitcoinlib')
conflicts=('python-bitcoin' 'python-pybitcointools' 'python-python-bitcoinlib')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
