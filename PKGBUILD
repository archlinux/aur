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

sha512sums=('f30b688b7f665ce342a4d792a473c23f9b22839e74425b267fd056aefddf0cde9027450a95748a0fe58fa736374f57cfd72374a04ad1901c128466cfb2fc048d'
            'f08b4f7ae13cb7c1dc380101dcc117502cc5979be0b1a23ec26aecf708ddaecd3dd4257fae505e3a338dd921f83c24b5b9f1d75d2d6bf2ea38397e255fc883bb'
            'b994a7511cb1579a1cdb0ff8796615bbcff55677639883b907914b873d3dc8cefd58b2e09ae9cb4352e648482227b8c028910bbd526e6d3c101b968ce6aa679f')

package() {
  mkdir -p "${pkgdir}/etc/systemd/system/"
  mkdir -p "${pkgdir}/opt/"
  
  sed -i "s/\.\/lib/\/opt\/inetsim\/lib/" "${srcdir}/${pkgname}-${pkgver}/inetsim"
  install -D -m644 "${srcdir}/inetsim.service" \
    "${pkgdir}/lib/systemd/system/inetsim.service"

  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/"
  mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/inetsim"

}
