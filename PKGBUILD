# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
_pkgepoch=2.1
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple Qt6 frontend to MPD"
arch=('x86_64')
url="https://sourceforge.net/projects/quimup/"
license=('GPL-3.0-or-later')
makedepends=()
depends=('mpd' 'qt6-base' 'taglib')
source=("quimup-$pkgver-source.tar.gz::https://sourceforge.net/projects/quimup/files/Quimup%20$_pkgepoch/Quimup-$pkgver.source.tar.gz")

prepare() {
  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
}

build() {
  cd build
  qmake6 PREFIX=/usr -Wnone "../Quimup-$pkgver.source"
  make
}

package() {
  # there is no install target
  install -Dm755 "$srcdir/build/quimup" "$pkgdir/usr/bin/quimup"

  # icons and other stuff
  install -dm755 "$pkgdir/usr/share"
  cp -r "$srcdir/Quimup-$pkgver.source/RPM_DEB_build/share/applications" "$pkgdir/usr/share"
  cp -r "$srcdir/Quimup-$pkgver.source/RPM_DEB_build/share/icons" "$pkgdir/usr/share"
  cp -r "$srcdir/Quimup-$pkgver.source/RPM_DEB_build/share/man" "$pkgdir/usr/share"
}

sha512sums=('c7d86deaa6483ea9467e2bc8dd7e413f67ebf271713cab939cda8c9689a52651b45724d99cdec7d72350273fb59e2542acf82ebc9da1cea8e0210f575351e686')
