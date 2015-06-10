# Maintainer: Tom Moore <tmoore01 (at) gmail (dot) com>

_pkgname=evolution-ews
pkgname=$_pkgname-git
pkgver=3.17.2.r1.g93fd330
pkgrel=1
pkgdesc="MS Exchange integration through Exchange Web Services"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="https://wiki.gnome.org/Apps/Evolution/EWS"
depends=('libmspack' 'evolution-git')
makedepends=('intltool')
options=('!emptydirs')
conflicts=('evolution-ews')
replaces=('evolution-ews')
provides=('evolution-ews')
source=(git://git.gnome.org/evolution-ews)
sha256sums=('SKIP')

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/evolution --disable-static
  make
}

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long | sed 's/^EVOLUTION_EWS_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

package() {
  cd $srcdir/_$pkgname
  make DESTDIR="$pkgdir" install
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="${pkgdir}" install
  cd "$srcdir"
}
