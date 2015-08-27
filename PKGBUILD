# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=ganglia-web
pkgver=3.6.2
pkgrel=2
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
sha256sums=('5368dc424fadc0fe1cc47730a628f514f710d59f7f6a4c53848f1a8f1116932a'
            '5d750ce804626eb657758875dc006fe467d92c20d79e3b4a05d099360887ec5b'
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
