# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyspv-git
pkgver=20140325
pkgrel=1
pkgdesc="Programmable Bitcoin SPV node in Python"
arch=('any')
depends=('openssl' 'python' 'python-bitarray')
makedepends=('git' 'python-setuptools')
url="https://github.com/sarchar/pyspv"
license=('MIT')
source=(git+https://github.com/sarchar/pyspv)
sha256sums=('SKIP')
provides=('pyspv')
conflicts=('pyspv')

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
