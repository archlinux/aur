pkgname=beautifuldnsd
pkgver=0.7
pkgrel=1
pkgdesc="Quick and clean DNS proxy, especially useful for users with poor ISPs"
arch=('any')
url="https://github.com/programmervy/beautifuldnsd"
license=("custom:PublicDomain")
depends=('python>=3.7' 'python-dnslib' 'python-yaml')
optdepends=(
  'dnsmasq: DNS cache'
  'systemd-resovled: DNS cache'
  'python-pygeoip: China only DNS configuration'
  'geoip-database: provides a database for geoip lookups'
)
backup=("etc/${pkgname}.yaml")
install=beautifuldnsd.install
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1516c34da9b66e492cd85b9a71c01682a0ffe90c00b1e8aaf6eacbc2aad2e8482653042eb476438aa92a837ced6d123bd695bab0a55cce1d292bd50de5668b46')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 systemd/beautifuldnsd.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 systemd/tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -D -m644 beautifuldnsd.yaml "${pkgdir}/etc/${pkgname}.yaml"
  install -D -m755 beautifuldnsd "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/READEMD.md"
}

