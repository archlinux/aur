pkgname=beautifuldnsd
pkgver=0.4
pkgrel=1
pkgdesc="Quick and clean DNS proxy, especially useful for users with poor ISPs"
arch=('any')
url=https://github.com/programmervy/beautifuldnsd
license=("public domain")
depends=('python>=3.4' 'python-dnslib' 'python-yaml')
optdepends=(
  'dnsmasq: DNS cache'
  'python-pygeoip: China only DNS configuration'
  'geoip-database: provides a database for geoip lookups'
)
backup=("etc/${pkgname}.yaml")
install=beautifuldnsd.install
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('f750c7df394256816c22636d836fbbd7')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 systemd/beautifuldnsd.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 systemd/tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -D -m644 beautifuldnsd.yaml "${pkgdir}/etc/${pkgname}.yaml"
  install -D -m755 beautifuldnsd "${pkgdir}/usr/bin/${pkgname}"
}

