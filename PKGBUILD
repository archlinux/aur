# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=hash-slinger
pkgver=3.5
pkgrel=1
pkgdesc="Tools to generate special DNS records (SSHFP, TLSA, OPENPGPKEY, IPSECKEY)"
arch=(any)
url="https://github.com/letoams/hash-slinger"
license=('GPL-2.0-or-later')
depends=('python-dnspython' 'python-cryptography' 'unbound')
makedepends=('xmlto')
optdepends=('openssh: for sshfp'
            'python-gnupg: for openpgpkey'
            'libreswan: for ipseckey (if not using openswan or strongswan)'
            'openswan: for ipseckey (if not using libreswan or strongswan)'
            'strongswan: for ipseckey (if not using libreswan or openswan)')
source=(https://github.com/letoams/${pkgname}/archive/${pkgver}.tar.gz)
b2sums=('ed90c5dced9c373bac00b64fd8d9f2cce51456d567ced5d22f815c23c4e346719dd08859271700a9469b8b4750fd7867f56b56db672df0d14eff5c4d44475ccd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
