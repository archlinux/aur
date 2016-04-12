# Maintainer: /dev/rs0 </dev/rs0@secretco.de.com>
# Contributor: Conrad Nelson <yaro@marupa.net>

pkgname=kildclient-git
pkgver=r1359.1103a2d
pkgrel=1
pkgdesc="A powerful MUD client written for GTK+ and support for Perl."

arch=('i686' 'x86_64')
url="http://kildclient.sourceforge.net"
license=('GPL')

replaces=('kildclient')
conflicts=('kildclient')
provides=('kildclient=3.0.1')

makedepends=('git')
depends=('gtk3' 'libglade' 'gtkspell3' 'perl-locale-gettext' 'perl-json' 'perl-xml-libxml')
source=('kildclient::git+http://git.code.sf.net/p/kildclient/git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/kildclient"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/kildclient"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-gtkspell \
    --with-libgnutls \
    --with-docs
}

build() {
  cd "${srcdir}/kildclient"  
  make || return 1
}

package() {
  cd "${srcdir}/kildclient"
  make DESTDIR="${pkgdir}/" install
}
