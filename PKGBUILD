# Maintainer: steelt <steeltitanium1 at gmail dot com>

pkgname=xssproxy-git
pkgver=v1.1.0.r2.g4b8333c
pkgrel=1
pkgdesc="Forward freedesktop.org idle inhibition service calls to Xss. (git version)"
arch=('x86_64')
url="https://github.com/vincentbernat/xssproxy"
license=('GPL3')
depends=('libxss' 'glib2' 'dbus')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/vincentbernat/xssproxy.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" bindir="/usr/bin" man1dir="/usr/share/man/man1" install
}
