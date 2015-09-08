# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

pkgname=libsigrokdecode-git
_pkgname=libsigrokdecode
pkgver=1023.e4bafb8
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, protocol decoders library (git version)"
arch=('i686' 'x86_64')
url="http://www.sigrok.org/wiki/Libsigrokdecode"
license=('GPL3')
depends=('python' 'glib2')
makedepends=('git')
provides=('libsigrokdecode')
conflicts=('libsigrokdecode')
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
