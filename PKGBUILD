# Maintainer: Gaspard d'Hautefeuille <gaspard@dhautefeuille.eu>
pkgname=hash-slinger-git
pkgver=3.1
pkgrel=1
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
conflicts=('hash-slinger')
source=(git+https://github.com/letoams/hash-slinger)
sha512sums=('SKIP')

pkgver() {
  cd hash-slinger
  git describe --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd "$srcdir/hash-slinger"
  make
}

package() {
  cd "$srcdir/hash-slinger"
  make DESTDIR="$pkgdir/" install
}
