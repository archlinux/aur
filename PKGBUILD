# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=ganglia-web
pkgver=3.7.0
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
sha256sums=('1a3f7046d0d9ba1fc5177f9fd54bdf201b6178cf27108320c4924e1c475a44e9'
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
