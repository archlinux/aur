# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=3.4
pkgrel=2
pkgdesc='A pass extension for importing data from most existing password managers.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
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
)
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('cea580eaa18783f992f2a3bc28b3e47494640256f7ee44a98632b9498fe48516d6c36bf9af525b22f300165c3da002b80ff46163b5960ab7c5a1c20e3a1a0442'
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
