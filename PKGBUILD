#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=inetsim
pkgver=1.2.5
pkgrel=1
pkgdesc="Internet Services Simulation Suite"
url="http://www.inetsim.org"
depends=('perl' 'perl-net-server' 'perl-net-dns' 'perl-ipc-shareable' 'perl-digest-sha1' 'perl-io-socket-ssl')
install=inetsim.install
arch=('i686' 'x86_64')
license=('GPL')
conflicts=()
backup=()
optdepends=('perlipq: Support for IP-based connection redirection')
source=("http://www.inetsim.org/downloads/${pkgname}-${pkgver}.tar.gz"
		"inetsim.service"
    "inetsim.install")

md5sums=('f3a125ff6dd5618f7e14975628ec47a4'
         '6db105d580545d9ac693fa922b6f098f'
         'c209c8fdcfa4b07ca65ae6c20cb5977c')

package() {
  mkdir -p "${pkgdir}/etc/systemd/system/"
  mkdir -p "${pkgdir}/opt/"
  
  sed -i "s/\.\/lib/\/opt\/inetsim\/lib/" "${srcdir}/${pkgname}-${pkgver}/inetsim"
  install -D -m644 "${srcdir}/inetsim.service" \
    "${pkgdir}/lib/systemd/system/inetsim.service"

  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/"
  mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/inetsim"

}
