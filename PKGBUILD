# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor (Arch): SpepS <dreamspepser at yahoo dot it>
# Contributor (Arch): Ander <anderraso@gmail.com>

pkgname=gnuhealth
pkgver=3.0.0
pkgrel=1
pkgdesc="A free Health and Hospital Information System"
arch=any
url=http://health.gnu.org/
license=GPL3
depends=(
          postgresql
          pygtk
          python2-dateutil
          python2-ldap 
          python2-pillow
          python2-pip
          python2-psycopg2
          python2-pytz
          python2-pywebdav
          python2-qrcode 
          python2-vobject
          "trytond>=3.8"
          "trytond-account-invoice>=3.8"
          "trytond-calendar>=3.8"
          "trytond-country>=3.8"
          "trytond-stock-lot>=3.8"
)
source=(
  http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz
  http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz.sig
)
sha512sums=(
  8859813722f811c62faaaf632dc1d3b3b4ff9a7a33a360a2ac7107fa90fd2a0ea0ff1b9055f240ba4299a00b25435302996d0f51ce766084a88c36cbe5f8e5cb
  SKIP
)
validpgpkeys=(
  14C7FD1362749706D602FBE2EADA01E3E44B8011 # Luis Falcon (meanmicio at GNU) <falcon@gnu.org>
)

prepare() {
  # fix python2 problem
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' $(grep -rlI '/usr/bin/env python')
}

package() {
  # build gnuhealth modules
    for module in health*
    do
      cd $srcdir/$pkgname-$pkgver/$module
      python2 setup.py install --root=$pkgdir
    done

  # put gnuhealth manual to man folder
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 health/man/$pkgname.1 \
      $pkgdir/usr/share/man/man1/$pkgname.1
}
