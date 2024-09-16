# Maintainer: bernimoses <`echo YmVybmltb3Nlc0BkbnNwcm9qZWN0LmRlCg== | base64 -d`>

pkgname=msktutil
pkgver=1.2.2
pkgrel=1
pkgdesc='Msktutil creates user or computer accounts in Active Directory, creates Kerberos keytabs on Unix/Linux systems, adds and removes principals to and from keytabs and changes the user or computer account´s password.'
arch=('x86_64')
url="https://github.com/msktutil/$pkgname"
license=('GPL2')
depends=('cyrus-sasl-gssapi')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('51314bb222c20e963da61724c752e418261a7bfc2408e7b7d619e82a425f6541')

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
