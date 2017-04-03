# Maintainer: Mantas Mikulėnas <grawity@gmail.com>

pkgname=ldapvi
pkgver=1.7.r15.gf1d42ba
pkgrel=1
pkgdesc="Interactive LDAP client for Unix terminals"
url="http://www.lichteblau.com/ldapvi/"
license=(GPL2)
arch=(i686 x86_64)
depends=(glib2 libldap libsasl ncurses openssl popt readline)
#source=("http://www.lichteblau.com/download/$pkgname-$pkgver.tar.gz")
#sha256sums=('6f62e92d20ff2ac0d06125024a914b8622e5b8a0a0c2d390bf3e7990cbd2e153')
makedepends=(git)
_commit=f1d42bad66cc4623d1ff21fbd5dddbf5009d3e40
source=("git+http://www.lichteblau.com/git/$pkgname.git#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/.r/; s/-/./'
}

prepare() {
  cd "$pkgname/$pkgname"
  ./autogen.sh
}

build() {
  cd "$pkgname/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
