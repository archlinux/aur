# Maintainer: bernimoses <`echo YmVybmltb3Nlc0BkbnNwcm9qZWN0LmRlCg== | base64 -d`>

pkgname=msktutil
pkgver=1.2.1
pkgrel=1
pkgdesc='Msktutil creates user or computer accounts in Active Directory, creates Kerberos keytabs on Unix/Linux systems, adds and removes principals to and from keytabs and changes the user or computer account´s password.'
arch=('x86_64')
url="https://github.com/msktutil/$pkgname"
license=('GPL2')
depends=('cyrus-sasl-gssapi')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('f9686237c4e24414802415f4c8627c7343da365c5a3bcdef7a853fa3cd27b45d')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/^sbindir/ s/$(prefix)\/sbin/@sbindir@/' Makefile.in
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
