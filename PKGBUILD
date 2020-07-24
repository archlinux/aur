# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>
# Contributor: Manolis Tzanidakis

pkgname=gkrellweather
pkgver=2.0.8
pkgrel=8
pkgdesc="A weather monitor plugin for gkrellm2"
url="http://gkrellm.srcbox.net/"
arch=('i686' 'x86_64')
depends=('gkrellm' 'perl' 'perl-lwp-protocol-https' 'gtk2')
license=('GPL')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/gkrellweather_2.0.8.orig.tar.gz)
sha256sums=(06236ad489151019e71bab4ba63b4b8b06d58c58890caed8b1a28fdd05cde16d)

patch=$(realpath $pkgname-$pkgver.patch)

prepare() {
  cd $pkgname-$pkgver
  patch < $patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 gkrellweather.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellweather.so"
  install -D -m755 GrabWeather "$pkgdir/usr/share/gkrellm/GrabWeather"
}

# vim: ts=2 sw=2 et ft=sh
