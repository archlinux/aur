# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
_pkgepoch=2.1
pkgver=2.1.1
pkgrel=1
pkgdesc="A simple Qt6 frontend to MPD"
arch=('x86_64')
url="https://sourceforge.net/projects/quimup/"
license=('GPL-3.0-or-later')
makedepends=()
depends=('mpd' 'qt6-base' 'taglib')
source=("quimup-$pkgver-source.tar.gz::https://sourceforge.net/projects/quimup/files/Quimup%20$pkgver/Quimup-$pkgver.source.tar.gz")

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

sha512sums=('4adec84bcd6e9825a1610fb74be5768d1d3eeeb641fdb57b64db6904a0b8cfad48fc9cb53732f169710528085d9433e35f936a519a8128b822a89fa971b5533b')
