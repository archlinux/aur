# Maintainer: melchips <truphemus dot francois at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Olivier Duclos <olivier.duclos gmail.com>

pkgname=xcompmgr-git
pkgver=1.1.7.r0.ge99e569
pkgrel=1
pkgdesc="The X Composisting Manager fresh from freedesktop.org repositories"
arch=(i686 x86_64)
url="http://www.freedesktop.org/Software/xapps"
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender')
makedepends=('git' 'xorg-util-macros')
provides=(xcompmgr)
conflicts=(xcompmgr xcompmgr-dana)
replaces=(xcompmgr xcompmgr-dana)
source=("$pkgname::git+git://anongit.freedesktop.org/git/xorg/app/xcompmgr")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/xcompmgr\.//'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
}
