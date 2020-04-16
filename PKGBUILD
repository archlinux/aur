# Maintainer: Gaspard d'Hautefeuille <gaspard@dhautefeuille.eu>
pkgname=hash-slinger
pkgver=3.0
pkgrel=2
pkgdesc="Tools to generate special DNS records (SSHFP, TLSA, OPENPGPKEY, IPSECKEY)"
arch=(any)
url="https://github.com/letoams/hash-slinger"
license=('GPL2')
depends=('python-dnspython' 'python-ipaddress' 'python-m2crypto' 'python-unbound')
makedepends=('xmlto')
optdepends=('openssh: for sshfp'
            'python-gnupg: for openpgpkey'
            'libreswan: for ipseckey (if not using openswan or strongswan)'
            'openswan: for ipseckey (if not using libreswan or strongswan)'
            'strongswan: for ipseckey (if not using libreswan or openswan)')
source=(https://github.com/letoams/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('1e39dbba1926a5b07119dcbd55a7f55f09349f3b7bda7fba12dae5056535c0ef')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
