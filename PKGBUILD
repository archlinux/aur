# Maintainer: TC <crt@archlinux.email>
pkgname=openssh-ldap-publickey-git
_pkgname=openssh-ldap-publickey
pkgver=20170922
pkgrel=1
pkgdesc="Wrapper for OpenSSH to store public keys inside the OpenLDAP entry."
arch=('any')
url="https://github.com/AndriiGrytsenko/openssh-ldap-publickey"
license=('custom')
install='openssh-ldap-publickey.install'
makedepends=('pear-net-ldap2' 'pear-net-ldap3' 'perl-net-ldap-server')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+git://github.com/AndriiGrytsenko/openssh-ldap-publickey'
        'openssh-ldap-publickey.install')
sha256sums=('SKIP'
            'ce5a0c98b60c8d422acfc706fa23b4ea66f9fc03ea599e0ccf032024a3267810')
pkgver() {
  cd "$_pkgname"
  date '+%Y%m%d'
}

build() {
    cd "$srcdir/$_pkgname"
    msg "Nothing to build.."
}

package() {
	cd "$srcdir/$_pkgname"
	
    # install openssh-ldap-publickey to /usr/local/bin 
    install -Dm644 "bin/openssh-ldap-publickey" \
        "${pkgdir}/usr/local/bin/openssh-ldap-publickey"

    # install man page 
    install -Dm644 "man/openssh-ldap-publickey.8" \
        "${pkgdir}/usr/share/man/man8/openssh-ldap-publickey.8"

    # install openssh-lpk-openldap.schema to openldap schema directory with ldap:ldap perms
    install -Dm644 -o 439 -g 439 "misc/openssh-lpk-openldap.schema" \
        "${pkgdir}/etc/openldap/schema/openssh-lpk-openldap.schema"
}
