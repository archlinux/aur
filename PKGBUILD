# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=parcellite-git
pkgver=1.2.5.r0.ff88303
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager (git version)"
arch=('x86_64')
url="https://github.com/rickyrockrat/${pkgname%%-*}"
license=('GPL-3.0-only')
depends=('gtk2')
makedepends=('git'
             'intltool'
             'psmisc')
optdepends=('xdotool: auto-paste support')
conflicts=('parcellite')
provides=('parcellite')
source=("$pkgname::git+https://github.com/rickyrockrat/${pkgname%%-*}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  touch src/config.simple.h
}

build() {
  cd "${srcdir}/${pkgname}"
  LDFLAGS+=' -Wl,-z,cet-report=error' make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" prefix=/usr sysconfdir=/etc install
}
