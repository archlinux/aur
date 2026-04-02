# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=hash-slinger-git
pkgver=3.5+r1+gafc7b2f
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
conflicts=('hash-slinger')
source=(git+https://github.com/letoams/hash-slinger)
b2sums=('SKIP')

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
