# Maintainer: K1412 <jonathan@opensides.be>
pkgname=fusiondirectory-schema
pkgver=1.0.8.9
pkgrel=1
pkgdesc="LDAP core schemas and insert script."
arch=('any')
url="http://fusiondirectory.org/"
license=('LGPL')

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz"
        'fixes-openldap-path.patch')

md5sums=('b894b28677ed7bb9c95753757b5ad99d'
         'd1126008d8486f24f4c081256ac2a7e4')

prepare() {
  # In srcdir
  cd "$srcdir/fusiondirectory-$pkgver"

  # Apply patchs
  patch -p1 -i ../fixes-openldap-path.patch

  # Right for executables 
  chmod 750 ./contrib/bin/*
}

package() {
	# In srcdir
	cd "$srcdir/fusiondirectory-$pkgver"

	# Copy docs
	mkdir -p $pkgdir/usr/share/doc/$pkgname/
	cp ./AUTHORS ./Changelog ./COPYING $pkgdir/usr/share/doc/$pkgname/

	# Move the schemas
	mkdir -p $pkgdir/etc/openldap/schema/fusiondirectory/
	mkdir -p $pkgdir/usr/share/doc/$pkgname/
	cp -a contrib/openldap/* $pkgdir/etc/openldap/schema/fusiondirectory/
	rm $pkgdir/etc/openldap/schema/fusiondirectory/slapd.conf 

	# Move executables
	mkdir -p $pkgdir/usr/bin/
	cp ./contrib/bin/fusiondirectory-insert-schema $pkgdir/usr/bin/
}
