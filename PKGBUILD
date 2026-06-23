# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
pkgver=2.1.2
pkgrel=1
pkgdesc="A simple Qt6 frontend to MPD"
arch=('x86_64')
url="https://sourceforge.net/projects/quimup/"
license=('GPL-3.0-or-later')
makedepends=()
depends=('mpd' 'qt6-base')
source=("quimup-$pkgver-source.tar.gz::https://sourceforge.net/projects/quimup/files/Quimup%20${pkgver}/quimup_${pkgver}_source.tar.gz")

prepare() {
  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
}

build() {
  cd build
  qmake6 PREFIX=/usr -Wnone "../quimup_${pkgver}_source"
  make
}

package() {
  # there is no install target
  install -Dm755 "$srcdir/build/quimup" "$pkgdir/usr/bin/quimup"

  # icons and other stuff
  install -dm755 "$pkgdir/usr/share"
  cp -r "$srcdir/quimup_${pkgver}_source/RPM_DEB_build/share/applications" "$pkgdir/usr/share"
  cp -r "$srcdir/quimup_${pkgver}_source/RPM_DEB_build/share/icons" "$pkgdir/usr/share"
  cp -r "$srcdir/quimup_${pkgver}_source/RPM_DEB_build/share/man" "$pkgdir/usr/share"
}

sha512sums=('8dcf58864a3577991aaa21c30e0a5dc61133a4863777f02bb604455a76e27e6dd2856b676ed242392c4d4986b57653a7ad3c0517899ff63c0a22594f7d7456f9')
