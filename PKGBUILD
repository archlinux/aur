pkgname=cutecoin-git
pkgrel=1
pkgver=0.10.2.r0.g25699ba
arch=(any)
depends=(python python-libnacl python-requests python-scrypt python-pylibscrypt
python-base58)
source=(cutecoin-git::git://github.com/ucoin-io/cutecoin.git)
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$pkgname"
  python gen_resources.py
  python gen_translations.py
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/"  --optimize=1
}
