# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Patrick Burroughs <celticmadman@gmail.com>

pkgname=flac123
pkgver=0.0.12
pkgrel=5
pkgdesc='Command-line program for playing FLAC audio files'
arch=('x86_64')
license=('GPL2')
url="https://sourceforge.net/projects/flac-tools/"
depends=('glibc' 'popt')
makedepends=('flac' 'libao')
source=("https://downloads.sourceforge.net/flac-tools/${pkgname}-${pkgver}-release.tar.gz")
sha256sums=('1976efd54a918eadd3cb10b34c77cee009e21ae56274148afa01edf32654e47d')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  depends+=('libFLAC.so' 'libao.so')
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,BUGS,NEWS,README,README.remote,ChangeLog} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:ts=2 sw=2 et:
