# Maintainer: /dev/rs0 </dev/rs0@secretco.de.com>
# Contributor: Conrad Nelson <yaro@marupa.net>

pkgname=kildclient-git
pkgver=r1347.e437da1
pkgrel=1
pkgdesc="A powerful MUD client written for GTK+ and support for Perl."

arch=('i686' 'x86_64')
license=('GPL')
url="http://kildclient.sourceforge.net"

makedepends=('git')
depends=('gtk3' 'libglade' 'gtkspell3' 'perl-locale-gettext' 'perl-json')
source=('kildclient::git+http://git.code.sf.net/p/kildclient/git')
md5sums=('SKIP')

pkgver() {
  cd "kildclient"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "kildclient"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --mandir=/usr/man \
    --with-gtkspell \
    --with-libgnutls \
    --with-docs
  make || return 1
}

package() {
  cd "kildclient"
  make DESTDIR="${pkgdir}/" install
}
