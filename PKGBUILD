# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

pkgname=sigrok-cli-git
_pkgname=sigrok-cli
pkgver=376.24bd971
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, CLI client (git version)"
arch=('i686' 'x86_64')
url="http://www.sigrok.org/wiki/Sigrok-cli"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git')
makedepends=('git')
provides=('sigrok-cli')
conflicts=('sigrok-cli')
source=("git://sigrok.org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
