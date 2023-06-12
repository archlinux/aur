# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=patator
pkgver=0.9
pkgrel=2
pkgdesc="A multi-purpose bruteforcer"
arch=(any)
url="https://github.com/lanjelot/patator"
license=(GPL2)
depends=(python)
optdepends=(
  'python-paramiko: SSH'
  'python-pycurl: HTTP'
  'openldap: LDAP'
  'impacket: SMB'
  'mysql-python: MySQL'
  'python-psycopg2: PostgreSQL'
  'python-crypto: VNC'
  'python-pydns: DNS'
  'python-pysnmp: SNMP'
  'python-ipy: NETx keywords'
  'java-runtime: keystore files'
  'unzip: zip archives'
)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('dfec3106e3bbab15b83135e17728e8dbb325f2697875364d99abc2ebba15fd5a')

build() {
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python|g' -i "$srcdir/${pkgname}-$pkgver/${pkgname}.py"
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
