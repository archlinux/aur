# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>
# Contributor: Manolis Tzanidakis

pkgname=gkrellweather
pkgver=2.0.8
pkgrel=3
pkgdesc="A weather monitor plugin for gkrellm2"
arch=('i686' 'x86_64')
depends=('gkrellm' 'perl' 'wget' 'gtk2')
license=('GPL')
url="https://sites.google.com/site/makovick/gkrellm-plugins"
source=("${pkgname}-${pkgver}.tgz::https://sites.google.com/site/makovick/projects/${pkgname}-${pkgver}.tgz?attredirects=0")
md5sums=('b21ed55cc9998eb7307ec53e99f9beea')

build() {
  cd $pkgname-$pkgver
  sed -i -e 's|/usr/local|/usr|' Makefile
  sed -i -e 's|PREFIX|"/usr/share/gkrellm"|' gkrellweather.c
  sed -i -e 's|/bin/GrabWeather|/GrabWeather|' gkrellweather.c
  make
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 gkrellweather.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellweather.so"
  install -D -m755 GrabWeather "$pkgdir/usr/share/gkrellm/GrabWeather"
}

# vim: ts=2 sw=2 et ft=sh
