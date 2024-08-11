# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgname=inetsim
pkgver=1.3.2
pkgrel=4
pkgdesc="Internet Services Simulation Suite"
url="https://www.inetsim.org"
depends=('perl-net-server' 'perl-net-dns' 'perl-ipc-shareable' 'perl-digest-sha1' 'perl-io-socket-ssl' 'perl-json' 'perl-string-crc32')
arch=('any')
license=('GPL-2.0-or-later')
source=("${pkgname}-${pkgver}.tar.gz::https://www.inetsim.org/downloads/${pkgname}-${pkgver}.tar.gz"
        "inetsim.service"
        "${pkgname}-${pkgver}.tar.gz.asc::https://www.inetsim.org/downloads/${pkgname}-${pkgver}.tar.gz.sig")

sha512sums=('2c26d4edbb3f77534d94976184d83bda4ba84b19534b39379d160d3f9b0fd4d437476885a1e20dd2d1d488e4a19910424db1f11587ea2d697ecfbbba77e76a05'
            'b0b5561ec915985545b6a9343cff530b022694d7bf7a06d4a2e55edb4f089e9f339ac491c6db741ca076683758d7bf294a1587236c45f80e76ae7a727663cad4'
            'SKIP')
validpgpkeys=('6D5205888B0232AADA6E5739F1446B68CB026896')
install="inetsim.install"

prepare() {
  sed -i "s/\.\/lib/\/opt\/inetsim\/lib/" "${srcdir}/${pkgname}-${pkgver}/inetsim"
}

package() {
  mkdir -p "${pkgdir}/opt/"

  install -D -m644 "${srcdir}/inetsim.service" \
    "${pkgdir}/usr/lib/systemd/system/inetsim.service"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/man1/inetsim.1" \
    "${pkgdir}/usr/share/man/man1/inetsim.1"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/de/man1/inetsim.1" \
    "${pkgdir}/usr/share/man/de/man1/inetsim.1"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/de/man5/inetsim.conf.5" \
    "${pkgdir}/usr/share/man/man5/inetsim.conf.5"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/man/de/man5/inetsim.conf.5" \
    "${pkgdir}/usr/share/man/man5/inetsim.conf.5"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/inetsim"

}

# vim:set et sw=2 ts=2 tw=79:
