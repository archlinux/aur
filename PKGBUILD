# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=3.1
pkgrel=2
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
sha512sums=('5673de22fd24b7676ef0c223bb39b8f70f1b35762195ca0f02f26bfeed849084f1c1ec982c447a2a763c06a0410612a8e708f0d29f082f4cf1a7d4263751a130'
            'b818ea2243602fa1b3bec1367348af94a4691bd0f622b8be5c7f2f8c308cf20b996c0c0f569b91eb68dfea82099ee2fd1a1c11ad722cd0a0d8a2003ed6008214')

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
