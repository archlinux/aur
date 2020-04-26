# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=3.0
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=(
  'pass'
  'python'
  'python-pyaml'
)
makedepends=('python-setuptools')
optdepends=(
  'python-defusedxml: xml based importers'
  'python-pykeepass: direct keepass database import'
  'python-secretstorage: gnome-keyring import'
  'python-cryptography: password encrypted otp import'
  'python-magic: Detection of file decryption'
)
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('e891d3bf8548dc852989d58bc8c3a411a21682d70fb9328037bfbe3c11509b6dbe5ec809ae8b834c7dffa3083dacb5af77081b9493c1ed1902d70df3c7d0977d'
            'ac40b7a163ed636f6ade46b385f589ed365a22c9b19eb47fd3e79e249bcd7230ebf2b03410bd6a423592bff9df287083dd2a7e890c3c442911ea1123560c5902')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
