# Contributor:  Taylor Lookabaugh <jesus dot christ dot i dot love at gmail dot com>
# Maintainer: LookTJ

pkgname=pidgin-gfire-git
pkgver=r547.1e33ad5 
pkgrel=1
pkgdesc="Plugin to Pidgin which adds Xfire network support (Dev/git tree)"
url="http://gfireproject.org/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('glib2' 'libpurple' 'libnotify' 'gtk2')
makedepends=('git' 'pkgconfig' 'intltool' 'libtool')
conflicts=('pidgin-gfire')
provides=('pidgin-gfire' 'pidgin-gfire-svn')

source=('pidgin-gfire-git::git+http://github.com/gfireproject/gfire#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  }

build() {
  cd "$srcdir/$pkgname"

  
  ./autogen.sh
  ./configure --prefix=/usr --enable-libnotify --enable-debug=verbose --enable-dbus-status
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

