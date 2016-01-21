# Maintainer: Heine Pedersen <heinep at gmail dot com>

pkgname=php-systemd
pkgver=0.1.2
pkgrel=1

pkgdesc="PHP extension allowing native interaction with systemd and its journal"
arch=("any")
url="https://github.com/systemd/php-systemd"
license=("MIT")
makedepends=("php")
backup=("etc/php/conf.d/systemd.ini")

source=("https://github.com/systemd/php-systemd/archive/release-${pkgver}.zip" 
        "php7-support.patch" 
        "systemd.ini")

sha512sums=("c2d8ec02b49630ebf51106f6113674b4bed130ae92a1e87b9349f90f28fa3b5f435efd5e4f86e76265aa27b5ef864ef0100f20b8a2e9b7f65c5612a35948b9c7"
            "c39aee724bc2140c48738d9b639efac24df80c2a8c0234fa07fcf243868b9fc5798f773d9dc056a1b0c19f8627c5cd6e7862a5881303c59964a68fc9a0e8a384"
            "86155fd1ea7eec8e6d1dfb292633c7731df1180bbb9988bb409a9bc0316fb597f5398e6956788bb3fb9bad15612fceef7742b877af0996e4c255d2952628b3e4")

build() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  patch -p1 < ../php7-support.patch
  phpize
  ./configure --prefix=/usr --with-systemd
  make
}

package() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 ${srcdir}/systemd.ini ${pkgdir}/etc/php/conf.d/systemd.ini
  install -Dm644 modules/systemd.so ${pkgdir}/usr/lib/php/modules/systemd.so
}

# vim:set ts=2 sw=2 et:
