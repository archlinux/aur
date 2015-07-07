# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: uvok <uvok at online dot de>

pkgname=bti-git
pkgver=034.r7.g1536609
pkgrel=1
pkgdesc="Console client for Twitter and identi.ca"
arch=('i686' 'x86_64')
url="http://gregkh.github.com/bti/"
license=('GPL')
makedepends=('docbook-xsl' 'git')
depends=('curl' 'json-c' 'libxml2' 'liboauth' 'pcre')
conflicts=('bti')
provides=('bti')
source=("$pkgname"::'git://github.com/gregkh/bti.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed  -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
