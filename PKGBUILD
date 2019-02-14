# Contributor: snakeroot <cwa AT pipeline DOT com>

_pkgname=urfkill
pkgname=urfkill-git
pkgver=urfkill.0.5.0.45.gb39a72f
pkgrel=2
pkgdesc="Handle rfkill events in userspace"
arch=('x86_64')
url="https://github.com/lcp/urfkill"
license=('GPL2')
depends=('expat>=2.01' 'gobject-introspection>=0.6.7' 'systemd-libs>=148' 'polkit>=0.91' 'systemd')
makedepends=('glibc>=2.20' 'git' 'gtk-doc')
conflicts=('urfkill')
provides=('urfkill')
source=("$_pkgname::git+https://github.com/lcp/urfkill.git")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --bindir=/usr/bin --datarootdir=/usr/share --libdir=/usr/lib libexecdir=/usr/lib --localstatedir=/var --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --with-session-tracking=systemd --enable-strict=no
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
