# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=polyglot-winboard-git
pkgver=d86ce4e
pkgrel=1
epoch=1
pkgdesc="UCI/USI/UCCI to XBoard adapter (WinBoard fork)"
arch=('i686' 'x86_64')
url="http://hgm.nubati.net/cgi-bin/gitweb.cgi?p=polyglot.git;a=summary"
license=('GPL2')
depends=('glibc')
provides=('polyglot')
conflicts=('polyglot')
replaces=('polyglot')
# If anyone knows the URL of the actual repository, please tell me!
source=("polyglot.tar.gz::http://hgm.nubati.net/cgi-bin/gitweb.cgi?p=polyglot.git;a=snapshot;h=refs/heads/learn;sf=tgz")
md5sums=('SKIP')

_enter_polyglot_directory() {
  cd $(ls -lt --color=never $srcdir | grep '^d' | grep -Eo 'polyglot-learn-[a-f0-9]+$' | head -n1)
}

pkgver() {
  _enter_polyglot_directory

  pwd | grep -Po '[a-f0-9]+$'
}

build() {
  _enter_polyglot_directory

  ./configure --prefix=/usr
  make
}

package() {
  _enter_polyglot_directory

  make DESTDIR="${pkgdir}" install
}
