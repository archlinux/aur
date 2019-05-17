# Maintainer: richteer <richteer at lastprime.net>

pkgname=profanity-git
_pkgname=profanity
pkgver=5179.c94f3d0b
pkgrel=1
pkgdesc="A console based jabber client."
arch=('i686' 'x86_64')
url="http://profanity-im.github.io"
license=('GPL3')
depends=('curl' 'expat' 'libgcrypt' 'libnotify' 'libotr' 'libxss' 'libsignal-protocol-c' 'libstrophe-git')
makedepends=('git' 'autoconf-archive')
provides=('profanity')
conflicts=('profanity')
source=("$_pkgname::git://github.com/profanity-im/profanity.git#branch=master")
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

