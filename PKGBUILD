# Maintainer: mathieui <mathieui[at]mathieui.net>

pkgname=poezio-git
_pkgname=poezio
pkgrel=1
pkgver=20150104.70536f4
pkgdesc="A full-featured command-line irc-like (muc-centered) jabber client (git)"
arch=('i686' 'x86_64')
url="http://poez.io"
conflicts=('poezio')
provides=('poezio')
license=('zlib')
depends=('python' 'python-setuptools' 'python-slixmpp-git')
makedepends=('git')
optdepends=('pure-python-otr-git: OTR plugin'
            'python-pyinotify: Autoaway screen plugin'
            'gnupg: GPG plugin'
            'figlet: ASCII art plugin'
            'python-sphinx: Generating documentation')

source=("git://git.poez.io/poezio/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d - | sed 's/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" prefix=/usr
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" prefix=/usr install
}
