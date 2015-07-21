# Contributor: Nahum Shalman <nshalman at elys dot com>
# Maintainer: Brad Arrington <bradla8 at yahoo.com>

pkgname=mod_auth_kerb
pkgver=5.4
pkgrel=4
pkgdesc="A Kerberos authentication module for the Apache Http Server"
arch=('i686' 'x86_64')
#url="http://sourceforge.net/projects/mod_auth_kerb/"
url="http://sourceforge.net/projects/modauthkerb/files/mod_auth_kerb/mod_auth_kerb-5.4/mod_auth_kerb-5.4.tar.gz/download"
license=('custom')
groups=()
depends=('apache>=2.0' 'heimdal')
makedepends=()
optdepends=()
conflicts=()
replaces=()
options=()
install=
source=(http://downloads.sourceforge.net/project/modauthkerb/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz auth_kerb.conf mod_auth_kerb.patch mod_auth_kerb_compile.patch)
noextract=()
md5sums=('642b81763ad3ca81dba359cb952da5e3'
         '399f8ab44947ac79f23f718c4ca9a527'
         '3a4ed51a6bfb949fc588148074e1df5a'
         '051f97f87667c92db00f34d20404261d')

build() {
     cd $startdir/src/$pkgname-$pkgver
     #patch -p0 < $startdir/$pkgname.patch
     patch -p1 < $startdir/mod_auth_kerb_compile.patch
     ./configure --without-krb4 --with-apache=$startdir/pkg

     mkdir -p $startdir/pkg/usr/lib/httpd/modules
     mkdir -p $startdir/pkg/etc/httpd/conf
     mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/

     make || return 1
     install -m 755 src/.libs/$pkgname.so $startdir/pkg/usr/lib/httpd/modules || return 1
     install -m 644 $startdir/src/auth_kerb.conf $startdir/pkg/etc/httpd/conf/auth_kerb.conf.sample || return 1
     install -m 644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/ || return 1
}
