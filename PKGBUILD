# Maintainer: oech3
# Contributor: Wouter Eerdekens <retuow at protonmail dot ch>
# Contributor: David Runge <dvzrv at archlinux dot org>
# Contributor: Alexander F Rødseth <xyproto at archlinux dot org>
# Contributor: Chris Brannon <chris at the-brannons dot com>
# Contributor: Corrado Primier <bardo at aur.archlinux dot org>
# Contributor: Patrick Burroughs <celticmadman at gmail dot com>

pkgname=flac123
pkgver=2.1.1
pkgrel=2
pkgdesc='Command-line program for playing FLAC audio files'
arch=('x86_64')
license=('GPL2')
url="https://github.com/flac123/flac123"
depends=('glibc' 'popt' 'flac' 'libao')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bdcf6ce573535b9282a87f17b9f0e8221303800444dbf430d980232fd0419680d83c74c7c3d8a4c1ce764f5a4752dca7483802d48a38bdb3ef50520e901cc2e5')

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
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm 644 {AUTHORS,BUGS,NEWS,README.md,README.remote,ChangeLog} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
