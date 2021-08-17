# Maintainer: HLFH <gaspard@dhautefeuille.eu>
# Contributor: Schnouki <schnouki@schnouki.net>

pkgname=hash-slinger
pkgver=3.1
pkgrel=2
pkgdesc="Tools to generate special DNS records (SSHFP, TLSA, OPENPGPKEY, IPSECKEY)"
arch=(any)
url="https://github.com/letoams/hash-slinger"
license=('GPL2')
depends=('python-dnspython' 'python-ipaddress' 'python-m2crypto' 'unbound')
makedepends=('xmlto')
optdepends=('openssh: for sshfp'
            'python-gnupg: for openpgpkey'
            'libreswan: for ipseckey (if not using openswan or strongswan)'
            'openswan: for ipseckey (if not using libreswan or strongswan)'
            'strongswan: for ipseckey (if not using libreswan or openswan)')
source=(https://github.com/letoams/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('2f0de62d561e585747732e44ce9ea5fcef93c75c95d66b684bd13b4e70374df6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
