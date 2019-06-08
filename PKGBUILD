# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.6
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-pyaml')
makedepends=('python-setuptools')
optdepends=('python-defusedxml: xml based importers'
            'python-pykeepass: direct keepass database import'
            'python-secretstorage: gnome-keyring import'
            'python-cryptography: password encrypted otp import')
source=(https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/roddhjav/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc)
sha512sums=('c20bf0fe9ae861dd5a67df8dfdd64946c740456b12ba1a860f3c596199bbd1de16ea93539723d5a8142746c23d357e70c05db8d9c3d465de13964fad5c0f5715'
            '9ad4be75710b3aead34e3b6feb0ebbe1bd735f664ad448991510c1cbdcb6c2f363b6fa88b5f0ee95d6cce838bc06140e533fa595a6ea8d4d93c0097e2274fde0')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
