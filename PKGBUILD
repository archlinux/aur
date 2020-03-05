# Maintainer: bernimoses <`echo YmVybmltb3Nlc0BkbnNwcm9qZWN0LmRlCg== | base64 -d`>

pkgname=msktutil-git
pkgver=1.1.r11.gdb1624c
pkgrel=3
pkgdesc='Msktutil creates user or computer accounts in Active Directory, creates Kerberos keytabs on Unix/Linux systems, adds and removes principals to and from keytabs and changes the user or computer account´s password.'
arch=('x86_64')
url="https://github.com/msktutil/${pkgname%-git}"
license=('GPL2')
depends=('cyrus-sasl-gssapi')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+.r+' | tr - . | cut -c 2-
}

prepare() {
  cd "${pkgname%-git}"
  sed -i '/^sbindir/ s/$(prefix)\/sbin/@sbindir@/' Makefile.in
}

build() {
  cd "${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
