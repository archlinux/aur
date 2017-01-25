# Maintainer: witti <dev at witti.su>
# Forked from profanity-git

pkgname=profanity-python2-git
_pkgname=profanity
pkgver=1.b712820
pkgrel=1
pkgdesc="A console based jabber client. Built against Python 2, to use Python 2 plugins."
arch=('i686' 'x86_64')
url="http://www.profanity.im"
license=('GPL3')
depends=('curl' 'expat' 'libnotify' 'libotr' 'libxss' 'libstrophe-git')
makedepends=('git' 'autoconf-archive')
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
  ./configure PYTHON_VERSION=2 --enable-python-plugins --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

