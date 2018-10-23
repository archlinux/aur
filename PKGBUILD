# Maintainer: David Runge <dave@sleepmap.de>
pkgname=midimsg-lv2
pkgver=0.0.4
pkgrel=1
pkgdesc="A collection of basic LV2 plugins to translate midi messages to usable values"
arch=('x86_64')
url="https://objectivewave.wordpress.com/midimsg-lv2/"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gcc-libs')
makedepends=('lv2' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d9d563f77941f8741928204f8940621f638a24f1bb2c13f116f0695a056a8792b486a7385f98bb0d93e7fede4c2d719c405b843a25c0782560d7b45a5cf4d404')

build() {
  cd "$pkgname-$pkgver"
  python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd "$pkgname-$pkgver"
  python2 ./waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
