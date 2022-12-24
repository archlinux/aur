# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

pkgname=orage-git
pkgver=4.16.0.r416.g6115255b
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=("i686" "x86_64")
license=('GPL2')
url="https://docs.xfce.org/apps/orage/start"
groups=('xfce4-goodies')
depends=('libxfce4ui' 'libnotify' 'libical')
makedepends=('git' 'xfce4-dev-tools')
provides=("orage")
conflicts=("orage")
source=("${pkgname%-git}::git+https://gitlab.xfce.org/apps/${pkgname%-git}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^orage-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
