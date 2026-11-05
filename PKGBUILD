# Maintainer: Dominik Kummer <admin@arkades.org>
pkgname=pamtester-git
pkgver=0.1.3.r0.gb40dde1
pkgrel=1
pkgdesc="Tiny program to test the pluggable authentication modules (PAM) facility (Git)"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.com/arkadesOrg/pamtester"
license=(BSD-3-Clause)
depends=(pam)
makedepends=(git autoconf automake libtool)
provides=(pamtester)
conflicts=(pamtester)

source=("$pkgname::git+https://gitlab.com/arkadesOrg/pamtester.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --match 'v[0-9]*' |
    sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname//-git}/LICENSE"
}

# vim: ts=2:sw=2:et
