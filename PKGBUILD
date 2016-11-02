# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor (Arch): SpepS <dreamspepser at yahoo dot it>
# Contributor (Arch): Ander <anderraso@gmail.com>

pkgname=gnuhealth
pkgver=3.0.3
pkgrel=1
pkgdesc="A free Health and Hospital Information System"
arch=(any)
url=http://health.gnu.org/
license=(GPL3)
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
          "trytond>=4.0"
          "trytond-account-invoice>=4.0"
          "trytond-calendar>=4.0"
          "trytond-country>=4.0"
          "trytond-stock-lot>=4.0"
)
source=(
  http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz
  http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz.sig
)
sha512sums=(
  c2bb7421187bc02f3eb6d0cd849a5df1d7eb4ae71fb2c034c27311de1c827480d9b96bdc0de6312fba1cd2a4e544dfed28e4091f431e3459039c9d49369dd9b4
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
