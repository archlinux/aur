# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-bitmerchant-git
pkgver=20150804
pkgrel=1
pkgdesc="Bitcoin/altcoin merchant tools"
arch=('any')
depends=('python' 'python-base58' 'python-ecdsa' 'python-six')
makedepends=('git' 'python-setuptools')
url="https://github.com/sbuss/bitmerchant"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/sbuss/bitmerchant)
sha256sums=('SKIP')
provides=('python-bitmerchant')
conflicts=('python-bitmerchant')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
