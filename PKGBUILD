# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=ganglia-web
pkgver=3.7.5
pkgrel=1
pkgdesc="Web front-end to Ganglia (see ganglia package)"
arch=('any')
url="https://github.com/ganglia/ganglia-web"
license=('BSD')
depends=('ganglia')
options=('!libtool' '!strip')
backup=(usr/share/webapps/ganglia/conf_default.php)
install='ganglia-web.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/ganglia/ganglia-web/archive/$pkgver.tar.gz"
        'ganglia-web.install')
sha256sums=('067f791287a11210d274acf4c9c1b5e3df3482ab3f3a151071cf6c926460cfa9'
            'b2d01098ffc3998143cbd4cc996f3ce572604b6c29f5c97e917f6de8986131da')

package() {
  # shellcheck disable=2154
  cd "$srcdir"/$pkgname-$pkgver || exit 1

  # shellcheck disable=2154
  make \
    DESTDIR="$pkgdir" \
    APACHE_USER=http \
    GDESTDIR=/usr/share/webapps/ganglia \
    GMETAD_ROOTDIR=/var/lib/ganglia \
    GWEB_STATEDIR=/var/lib/ganglia \
    install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
