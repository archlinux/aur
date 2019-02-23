# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=beatslash-lv2
pkgver=1.0.6
pkgrel=1
pkgdesc="A set of plugins for live beat repeating and beat slicing"
arch=('x86_64')
url="https://objectivewave.wordpress.com/beatslash-lv2"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio')
depends=('gtkmm')
makedepends=('lv2' 'lvtk' 'python2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blablack/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d20262946479cbbec1e48dd72a89be46f88d2f48fe55ba5d35535dcdcd1226d52cf57f335dd3aeb3f794590848bbd48e98eb0bf692840f3bd5e600ae93ca8614')

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
