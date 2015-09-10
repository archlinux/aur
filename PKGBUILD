# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=nikto-git
pkgver=2.1.6
pkgrel=1
pkgdesc='A web server scanner which performs comprehensive tests against web servers for multiple items'
url='https://github.com/sullo/nikto'
arch=('any')
license=('GPL')
depends=('sh' 'openssl' 'perl-net-ssleay' 'perl-json')
makedepends=('git')
backup=('etc/nikto.conf')
install=nikto.install
source=(${pkgname}::git+https://github.com/sullo/${pkgname}
        nikto.sh)
sha512sums=('13632018ef6862de7dc53c674d7266fcfb7e164bcf3070327c103cbf8737720ffb710ccc8949acc920a6e0a85da1bb7575d073ee245bc2ba3a8a292ad1695e69'
            '75b9be1f1cacbca09a5e72f8125aadc24938a3ac36b2337bf68916231af52e2af846a0dedb36782f45716d2c6d590a3606cb5879339528e7a744f1d2d880120d')

package() {
  cd ${pkgname}
  install -d "${pkgdir}/usr/share/nikto"
  cp -a program/* "${pkgdir}/usr/share/nikto"
  #find $pkgdir/usr/share/nikto -type f -exec chmod 644 {} +
  install -Dm 755 "${srcdir}/nikto.sh" "${pkgdir}/usr/bin/nikto"
  install -Dm 644 documentation/nikto.1 "${pkgdir}/usr/share/man/man1/nikto.1"
  install -Dm 644 program/docs/nikto_manual.html "${pkgdir}/usr/share/doc/${pkgname}/manual.html"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  ln -s /usr/share/nikto/nikto.conf "${pkgdir}/etc/nikto.conf"
}

# vim: ts=2 sw=2 et:
