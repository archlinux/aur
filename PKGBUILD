# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-audit'
pkgver=1.1
pkgrel=2
pkgdesc='A pass extension for auditing your password repository.'
arch=('any')
url='https://github.com/roddhjav/pass-audit'
license=('GPL3')
depends=(
  'pass'
  'python'
  'python-requests'
  'python-zxcvbn'
)
makedepends=('python-setuptools')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('2e4236becfa2c624640fa5a81ed787fce03cfd76fe2e77e60cb530169aad14effbafbab38becf6fa03dec46f67875dbb4e87e44fc0144ea7c8bf4d38ea65b936'
            '178ad19e19d59195825d3bd8825f03258d9bc8b397ddaf8a9b44e371c2fac1cbde025beb42713076527fd72f7782491a9cc2657f0695267251d92d162d6ec26f')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
