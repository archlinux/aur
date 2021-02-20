# Maintainer: Heine Pedersen <heinep at gmail dot com>

pkgname=php8-systemd
pkgver=0.1.2
pkgrel=1

pkgdesc="PHP extension allowing native interaction with systemd and its journal"
arch=("any")
url="https://github.com/systemd/php-systemd"
license=("MIT")
makedepends=("php")
depends=("libsystemd")
backup=("etc/php/conf.d/systemd.ini")

source=("https://github.com/systemd/php-systemd/archive/master.zip" 
        "systemd.ini")

sha512sums=('f55a893e40ff9a3fc37499783070bf80ce6ae348b848befca2bd011b54b9201d58a5ce8d0289cc3d14290fd43407a2bdd516bc8c162a17c8166d9b39feeb70bf'
            '86155fd1ea7eec8e6d1dfb292633c7731df1180bbb9988bb409a9bc0316fb597f5398e6956788bb3fb9bad15612fceef7742b877af0996e4c255d2952628b3e4')

build() {
  mv -v ${srcdir}/php-systemd-master  ${srcdir}/${pkgname}-release-${pkgver}
  cd ${srcdir}/${pkgname}-release-${pkgver}
  phpize
  ./configure --prefix=/usr --with-systemd
  make
}

check() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
make test
  }


package() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 ${srcdir}/systemd.ini ${pkgdir}/etc/php/conf.d/systemd.ini
  install -Dm644 modules/systemd.so ${pkgdir}/usr/lib/php/modules/systemd.so
}

# vim:set ts=2 sw=2 et:
