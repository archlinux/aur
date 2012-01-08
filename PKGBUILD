# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=patator
pkgver=0.3
pkgrel=2
pkgdesc="A multi-purpose bruteforcer"
arch=('any')
url="http://code.google.com/p/patator/"
license=('GPL2')
depends=('python2')
optdepends=(
  'python-paramiko: SSH'
  'python-pycurl: HTTP'
  'openldap: LDAP'
  'impacket: SMB'
  'cx_oracle: Oracle'
  'mysql-python: MySQL'
  'python2-psycopg2: PostgreSQL'
  'pycrypto: VNC'
  'python-pydns: DNS'
  'pysnmp: SNMP'
  'python2-ipy: NETx keywords'
  'java-runtime: keystore files'
  'unzip: zip archives'
)
source=("http://patator.googlecode.com/files/patator_v$pkgver.py")
sha256sums=('04d67703d07d6304a50ace799e5784300b90ddaac6f446d3a216caa1d2e51e88')

build() {
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' -i "$srcdir/${pkgname}_v$pkgver.py"
}

package() {
  install -D -m 0755 "$srcdir/${pkgname}_v$pkgver.py" "$pkgdir/usr/bin/patator"

  _modules=(
    'ftp_login'
    'ssh_login'
    'telnet_login'
    'smtp_login'
    'smtp_vrfy'
    'smtp_rcpt'
    'http_fuzz'
    'pop_passd'
    'ldap_login'
    'smb_login'
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
