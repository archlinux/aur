# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=3.5
pkgrel=2
pkgdesc='A pass extension for importing data from most existing password managers.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL-3.0-or-later')
depends=(
  'pass'
  'python'
  'python-pyaml'
  'python-zxcvbn'
  'python-requests'
)
makedepends=('python-setuptools')
optdepends=(
  'python-defusedxml: xml based importers'
  'python-pykeepass: direct keepass database import'
  'python-secretstorage: gnome-keyring import'
  'python-cryptography: password encrypted otp import'
  'python-magic: Detection of file decryption'
  'python-jsonpath-ng: json based filter' 
)
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('b52cf0f1c43b37030c0e6efddf9fe7ad37d2ce20b7059bb0253f128e5bcaac0e82a9f657b16a8eaab0896ac4736698f261cd7c62437a73726b3bfbfcd7b2f369'
            'SKIP')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
