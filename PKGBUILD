# Maintainer: AK <crt@archlinux.email>
pkgname=openssh-ldap-publickey
pkgver=1.0.2
pkgrel=1
pkgdesc="Wrapper for OpenSSH to store public keys inside the OpenLDAP entry."
arch=('any')
url="https://github.com/AndriiGrytsenko/openssh-ldap-publickey"
license=('custom')
install='openssh-ldap-publickey.install'
makedepends=('perl-net-ldap-server')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/AndriiGrytsenko/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "openssh-ldap-publickey.install")
sha256sums=('d848280cdee244d5aa55cb07aab68d732b83bce502b176d819deb892af169ab8'
            '3969eccfd326056ec1e00094c9ea7a47a8d79b0c51b4885a729051be781869a4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# install openssh-ldap-publickey to /usr/local/bin
  install -Dm755 "bin/openssh-ldap-publickey" \
    "${pkgdir}/usr/local/bin/openssh-ldap-publickey"

# install man page
  install -Dm644 "man/openssh-ldap-publickey.8" \
    "${pkgdir}/usr/share/man/man8/openssh-ldap-publickey.8"

# install openssh-lpk-openldap.schema to openldap schema directory with ldap:ldap perms
  install -Dm644 -o 439 -g 439 "misc/openssh-lpk-openldap.schema" \
    "${pkgdir}/etc/openldap/schema/openssh-lpk-openldap.schema"

# install license
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
