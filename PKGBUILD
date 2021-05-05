# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: richteer <richteer at lastprime.net>

pkgname=profanity-git
_pkgname=profanity
pkgver=6435.4a94c051
pkgrel=1
pkgdesc="A console based jabber client."
arch=('i686' 'x86_64')
url="http://profanity-im.github.io"
license=('GPL3')
depends=('curl' 'expat' 'libgcrypt' 'libnotify' 'libotr' 'libxss' 'libsignal-protocol-c'
          'gpgme' 'libstrophe-git')
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

