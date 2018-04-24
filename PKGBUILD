# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=ganglia-web
pkgver=3.7.2
pkgrel=1
pkgdesc="Web front-end to Ganglia (see ganglia package)"
arch=('any')
url="http://ganglia.sourceforge.net/"
license=('BSD')
depends=('ganglia')
options=('!libtool' '!strip')
install='ganglia-web.install'
source=("http://downloads.sourceforge.net/ganglia/$pkgname-$pkgver.tar.gz"
        'ganglia-web.install'
        'configuration.patch')
sha256sums=('98820187c98d24d3645b92d31060623de696dad331a361a19874898339523628'
            'b2d01098ffc3998143cbd4cc996f3ce572604b6c29f5c97e917f6de8986131da'
            '99991e9a17975b97c1049e7f8d6c92afb8dab75f987b2a13cb8cdf1faf1b1918')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for patch in $srcdir/*.patch; do
    msg2 "Applying patch $(basename $patch)"
    patch -Np1 -i $patch
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share/webapps"
  cp -a . "$pkgdir/usr/share/webapps/ganglia"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
