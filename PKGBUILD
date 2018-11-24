# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=patator
pkgver=0.7
pkgrel=1
pkgdesc="A multi-purpose bruteforcer"
arch=('any')
url="https://github.com/lanjelot/patator"
license=('GPL2')
depends=('python2')
optdepends=(
  'python2-paramiko: SSH'
  'python2-pycurl: HTTP'
  'openldap: LDAP'
  'impacket: SMB'
  'mysql-python: MySQL'
  'python2-psycopg2: PostgreSQL'
  'python2-crypto: VNC'
  'python2-pydns: DNS'
  'python2-pysnmp: SNMP'
  'python2-ipy: NETx keywords'
  'java-runtime: keystore files'
  'unzip: zip archives'
)
source=("https://github.com/lanjelot/patator/archive/$pkgver.tar.gz")
sha256sums=('2c9867c500e47997fdd69064b22fd36ffd79c8e8df8aca305403419b5dca5af9')

build() {
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' -i "$srcdir/${pkgname}-$pkgver/${pkgname}.py"
}

package() {
  install -D -m 0755 "$srcdir/${pkgname}-$pkgver/${pkgname}.py" "$pkgdir/usr/bin/patator"

  _modules=(
    'ftp_login'
    'ssh_login'
    'telnet_login'
    'smtp_login'
    'smtp_vrfy'
    'smtp_rcpt'
    'finger_lookup'
    'http_fuzz'
    'pop_login'
    'pop_passd'
    'imap_login'
    'ldap_login'
    'smb_login'
    'smb_lookupsid'
    'vmauthd_login'
    'mssql_login'
    'oracle_login'
    'mysql_login'
    'pgsql_login'
    'vnc_login'
    'dns_forward'
    'dns_reverse'
    'snmp_login'
    'unzip_pass'
    'keystore_pass'
  )
  for module in ${_modules[@]}; do
    ln -s /usr/bin/patator "$pkgdir/usr/bin/$module"
  done
}

# vim:set ts=2 sw=2 et:
