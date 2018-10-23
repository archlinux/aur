# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=beatslash-lv2
pkgver=1.0.5
pkgrel=2
pkgdesc="A set of plugins for live beat repeating and beat slicing"
arch=('x86_64')
url="https://objectivewave.wordpress.com/beatslash-lv2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gtkmm')
makedepends=('lv2' 'lvtk' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('089cd3329cef4e91f2e0b0c9cf09c524c2ce81571c35d93b92d88a69f0abecec3b5014116e4b88c960fb437bda17d539874ab3c9b95d04ca1df61a5fad575e69')

build() {
  cd "$pkgname-$pkgver"
  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
