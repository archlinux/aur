# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=parcellite-git
_pkgname=parcellite
pkgver=1.2.1.r11.fa54161
pkgrel=2
pkgdesc="Lightweight GTK+ clipboard manager (git version)"
arch=('x86_64')
url="https://github.com/rickyrockrat/parcellite"
license=('GPL3')
depends=('gtk2')
makedepends=('intltool' 'git')
optdepends=('xdotool: auto-paste support')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgname::git+https://github.com/rickyrockrat/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  autoreconf -i
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
