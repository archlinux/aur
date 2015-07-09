# Maintainer: Jonathan Kotta <jpkotta at gmail dot com>
# Contributor: Manolis Tzanidakis

pkgname=gkrellweather
pkgver=2.0.8
pkgrel=2
pkgdesc="A weather monitor plugin for gkrellm2"
arch=('i686' 'x86_64')
depends=('gkrellm' 'perl' 'wget' 'gtk2')
license=('GPL')
url="http://makovick.googlepages.com/gkrellmplugins"
source=("http://wwwcip.informatik.uni-erlangen.de/~sijojord/$pkgname-$pkgver.tgz")
md5sums=('b21ed55cc9998eb7307ec53e99f9beea')

build() {
  cd $srcdir/$pkgname-$pkgver

  /bin/sed -i -e 's|/usr/local|/usr|' Makefile
  /bin/sed -i -e 's|PREFIX|"/usr/share/gkrellm"|' gkrellweather.c
  /bin/sed -i -e 's|/bin/GrabWeather|/GrabWeather|' gkrellweather.c

  /usr/bin/make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 gkrellweather.so \
      $pkgdir/usr/lib/gkrellm2/plugins/gkrellweather.so
  install -D -m755 GrabWeather \
      $pkgdir/usr/share/gkrellm/GrabWeather
}
# vim: ts=2 sw=2 et ft=sh
