# Maintainer: K1412 <jonathan@opensides.be>
pkgname=fusiondirectory-schema
pkgver=1.2.1
pkgrel=1
pkgdesc="LDAP core schemas and insert script."
arch=('any')
url="http://fusiondirectory.org/"
license=('GPL')

depends=("schema2ldif")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz"
        'fixes-openldap-path.patch')

md5sums=('839d334fd2fb9817c070e855cc9f1a37'
         'd7eb89aed8063c2814d33673c1182c0a')

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

	# Move executables
	mkdir -p $pkgdir/usr/bin/
	cp ./contrib/bin/fusiondirectory-insert-schema $pkgdir/usr/bin/
}
