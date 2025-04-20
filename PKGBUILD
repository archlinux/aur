# Maintainer: Sławomir Spiewak <slawekwaga [at] gmail [dot] com>
# Contributor:  Emile Pesik <ristridin [at] gmail [dot] com>
# Contributor: Martin Imobersteg <imm [at] gmx [dot] ch> 
pkgname=smbldap-tools 
pkgver=0.9.11
pkgrel=4
pkgdesc="A set of perl scripts designed to manage user and group accounts stored in an LDAP directory." 
arch=(any) 
url="https://github.com/fumiyas/smbldap-tools"
license=("GPL")
depends=('samba' 'openldap' 'perl-digest-sha1' 'perl-crypt-smbhash' 'perl-ldap' 'perl-io-socket-ssl')
makedepends=('automake' 'autoconf')
source=("https://github.com/fumiyas/smbldap-tools/archive/v${pkgver}.tar.gz"
"fix_autoreconf_warnings.patch")
backup=(etc/smbldap-tools/smbldap.conf etc/smbldap-tools/smbldap_bind.conf)
sha256sums=('f8d43f7bb5b6cbea29e519b8d9cedd287e9c15978e9deb1fa1892618d2c8639c'
'5c7b5680923fba460707c96d74998ed33fbeb4d99913d855cb2e0f5af2b9b758')

prepare() {
  cd $srcdir/${pkgname}-${pkgver}
  patch -p1 -i $srcdir/fix_autoreconf_warnings.patch
  }

build() {
  cd $srcdir/${pkgname}-${pkgver}
  build/autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
  }
	
package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 smbldap.conf $pkgdir/etc/smbldap-tools/smbldap.conf 
  install -D -m644 smbldap_bind.conf $pkgdir/etc/smbldap-tools/smbldap_bind.conf 
  }
