# Maintainer: Emile Pesik <ristridin [at] gmail [dot] com> 
# Contributor: Martin Imobersteg <imm [at] gmx [dot] ch> 
pkgname=smbldap-tools 
pkgver=0.9.10
pkgrel=1 
pkgdesc="A set of perl scripts designed to manage user and group accounts stored in an LDAP directory." 
arch=(any) 
url="https://gna.org/projects/smbldap-tools/" 
license=("GPL")
depends=('samba' 'openldap' 'perl-digest-sha1' 'perl-unicode-maputf8' 'perl-crypt-smbhash' 'perl-ldap' 'perl-io-socket-ssl')
source=("http://download.gna.org/smbldap-tools/sources/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'smbldap-config.pl.patch') 
backup=(etc/smbldap-tools/smbldap.conf etc/smbldap-tools/smbldap_bind.conf)
md5sums=('f52a626637c468d66a4e71f30c174873'
         '36aed03f5fa270bd8ac5849feb200d46')

prepare() {
  cd $srcdir/${pkgname}-${pkgver}
  patch -p1 -i $srcdir/smbldap-config.pl.patch
  }

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
  }
	
package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 smbldap.conf $pkgdir/etc/smbldap-tools/smbldap.conf 
  install -D -m644 smbldap_bind.conf $pkgdir/etc/smbldap-tools/smbldap_bind.conf 
  }
