# Maintainer: richteer <richteer at lastprime.net>

pkgname=profanity-git
_pkgname=profanity
pkgver=2683.e65b6b2
pkgrel=1
pkgdesc="A console based jabber client."
arch=('i686' 'x86_64')
url="http://www.profanity.im"
license=('GPL3')
depends=('curl' 'expat' 'libnotify' 'libotr' 'libxss' 'libstrophe')
makedepends=('git')
provides=('profanity')
conflicts=('profanity')
source=("$_pkgname::git://github.com/boothj5/profanity.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

