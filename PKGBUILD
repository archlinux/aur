# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=patator
pkgver=1.0
pkgrel=2
pkgdesc="A multi-purpose bruteforcer"
arch=(any)
url="https://github.com/lanjelot/patator"
license=(GPL-2.0-only)
depends=(
  python
  python-dnspython
  python-pyasn1
)
optdepends=(
  'impacket: SMB'
  'java-runtime: keystore files'
  'openldap: LDAP'
  'python-crypto: VNC'
  'python-ipy: NETx keywords'
  'python-mysqlclient: MySQL'
  'python-paramiko: SSH'
  'python-psycopg2: PostgreSQL'
  'python-pycurl: HTTP'
  'python-pysnmp: SNMP'
  'unzip: zip archives'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b3eb75170bec398c81219665a39feff1a756ee62f7104753e2a661a29c3324cf')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname.py" "$pkgdir/usr/bin/patator"

  _modules=(
    ftp_login
    ssh_login
    telnet_login
    smtp_login
    smtp_vrfy
    smtp_rcpt
    finger_lookup
    http_fuzz
    pop_login
    pop_passd
    imap_login
    ldap_login
    smb_login
    smb_lookupsid
    vmauthd_login
    mssql_login
    oracle_login
    mysql_login
    pgsql_login
    vnc_login
    dns_forward
    dns_reverse
    snmp_login
    unzip_pass
    keystore_pass
  )
  for module in "${_modules[@]}"; do
    ln -s /usr/bin/patator "$pkgdir/usr/bin/$module"
  done
}
