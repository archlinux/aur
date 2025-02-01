# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-audit'
pkgver=1.2
pkgrel=3
pkgdesc='A pass extension for auditing your password repository.'
arch=('any')
url='https://github.com/roddhjav/pass-audit'
license=('GPL-3.0-or-later')
depends=(
  'pass'
  'python'
  'python-requests'
  'python-zxcvbn'
)
makedepends=('python-setuptools')
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('3036340b31612a52826c13ea558def3a3ca49164eb9b3c516f4923d99126cbe5e85150bca9f8ca26d70375bf92e1b06d606f39a3679de60770ab14f6f24a8267'
            'SKIP')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
