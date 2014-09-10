# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=hash-slinger
pkgver=2.5
pkgrel=1
pkgdesc="Tools to generate special DNS records (SSHFP, TLSA)"
arch=(any)
url="http://people.redhat.com/pwouters/hash-slinger/"
license=('GPL2')
depends=('openssh' 'python2-dnspython' 'python2-ipaddr' 'python2-m2crypto' 'python2-unbound')
makedepends=('xmlto')
source=(http://people.redhat.com/pwouters/${pkgname}/${pkgname}-${pkgver}.tar.gz
        http://people.redhat.com/pwouters/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc)
md5sums=('1054dced1533f9e5d8503f7b64407c2f'
         'SKIP')
sha256sums=('18bf3e97e5e7469328533a5e8cd0b8bdedcaa1e7a5a754b92d405578ebbd02a4'
            'SKIP')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  for f in openpgpkey sshfp tlsa; do
    sed -i 's@#!/usr/bin/python$@#!/usr/bin/env python2@' $f
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
