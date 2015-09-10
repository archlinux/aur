# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitmerchant-git
pkgver=20150909
pkgrel=1
pkgdesc="Bitcoin/altcoin merchant tools"
arch=('any')
depends=('python2'
         'python2-base58'
         'python2-cachetools'
         'python2-ecdsa'
         'python2-six')
makedepends=('git' 'python2-setuptools')
url="https://github.com/sbuss/bitmerchant"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/sbuss/bitmerchant)
sha256sums=('SKIP')
provides=('python2-bitmerchant')
conflicts=('python2-bitmerchant')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
