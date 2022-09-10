# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=3.3
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
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
makedepends=('python-setuptools' 'python-pypandoc')
optdepends=(
  'python-defusedxml: xml based importers'
  'python-pykeepass: direct keepass database import'
  'python-secretstorage: gnome-keyring import'
  'python-cryptography: password encrypted otp import'
  'python-magic: Detection of file decryption'
)
source=("https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('0502de0710c8cca9a75d6e3e3cab27cc660089702074974dee367f9ce56daea8337cca714977c6481224b85ed1d80f966f441437987438e9e04d2c8583c0efb7'
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
