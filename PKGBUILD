# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor (Arch): SpepS <dreamspepser at yahoo dot it>
# Contributor (Arch): Ander <anderraso@gmail.com>

pkgname=gnuhealth
pkgver=2.8.1
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
          "trytond>=3.4"
          "trytond-account-invoice>=3.4"
          "trytond-calendar>=3.4"
          "trytond-country>=3.4"
          "trytond-stock-lot>=3.4"
)
source=(
  http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz
  http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz.sig
)
sha512sums=(
  ae916daaa46d5e5572f6b7e78424f1606e8dbe22381de7b30e1b7f4194317b7f335c17b4fb5a2b7ffc338ae86c1bf2204fdcfe2116accb3124c18477930839fc
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
