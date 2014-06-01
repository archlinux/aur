# Maintainer: zml <zach at zachsthings dot com>
pkgname=istatd
pkgver=0.5.8
pkgrel=2
pkgdesc="iStat Server for Linux"
arch=('i686' 'x86_64')
url="http://bjango.com/iphone/istat/"
license=('BSD')
depends=('libxml2')
provides=('istatd')
install=${pkgname}.install
source=("https://github.com/downloads/tiwilliam/istatd/$pkgname-$pkgver.tar.gz"
        'istatd.service')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir
  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/" 
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

sha256sums=('6ef28191b4bdfc3dcf21ec21111853cc70e7d8fee7b0ced5d4e174b92637bf51'
            'a72b9624055e6e6749ca9907c54d82caa84ae72e510345758aedd120dcb52b10')
