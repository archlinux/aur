# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=bastet-xdg-git
pkgver=0.43.2.r7.g591258e
pkgrel=1
pkgdesc="Tetris(r) clone with 'bastard' block-choosing AI - Git version with support for Xdg Base Directories"
arch=('x86_64' 'i686')
url="https://github.com/BachoSeven/bastet/"
license=('GPL3')
depends=('boost-libs' 'ncurses')
makedepends=('git' 'boost')
provides=('bastet')
conflicts=('bastet')
source=("$pkgname::git+https://github.com/BachoSeven/bastet.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  # populate files
  install -D bastet "${pkgdir}"/usr/bin/bastet
  install -D -m 0644 bastet.6 "${pkgdir}"/usr/share/man/man6/bastet.6
  install -D -m 0644 bastet.png "${pkgdir}"/usr/share/pixmaps/bastet.png
  install -D -m 0644 bastet.desktop "${pkgdir}"/usr/share/applications/bastet.desktop
  install -D -m 0644 bastet.appdata.xml "${pkgdir}"/usr/share/appdata/bastet.appdata.xml
  for F in AUTHORS INSTALL NEWS README; do
    install -D -m 0644 ${F} "${pkgdir}"/usr/share/doc/bastet/${F}
  done

  install -d -m 0775 -g games "${pkgdir}"/var/games
  touch "${pkgdir}"/var/games/bastet.scores2
  chmod 0664 "${pkgdir}"/var/games/bastet.scores2
  chown root:games "${pkgdir}"/var/games/bastet.scores2
}
# vim:set ts=2 sw=2 et:
