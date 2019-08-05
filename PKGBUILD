# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=lemonldap-ng
pkgver=2.0.5
pkgrel=1
pkgdesc="A modular WebSSO (Single Sign On) based on Apache::Session modules"
arch=(any)
url="https://lemonldap-ng.org/"
license=('GPL')
depends=('perl-apache-session' 'perl-cache-cache' 'perl-clone' 'perl-config-inifiles' 'perl-convert-pem'
         'perl-crypt-openssl-bignum' 'perl-crypt-openssl-rsa' 'perl-crypt-openssl-x509'
         'perl-crypt-rijndael' 'perl-dbi' 'perl-digest-hmac' 'perl-email-sender' 'perl-gd-securityimage'
         'perl-html-template' 'perl-io-string' 'perl-json' 'perl-mime-tools' 'perl-mouse'
         'perl-ldap' 'perl-plack' 'perl-regexp-assemble' 'perl-regexp-common' 'perl-soap-lite'
         'perl-string-random' 'perl-unicode-string' 'perl-uri' 'perl-libwww' 'perl-lwp-protocol-https'
         'perl-xml-simple' 'perl-xml-libxslt' 'perl-crypt-urandom'
         'perl-module-pluggable' 'perl-convert-base32' 'perl-text-unidecode')
makedepends=()
checkdepends=()
optdepends=('uwsgi-plugin-psgi: for running under uWSGI')
source=("https://release.ow2.org/lemonldap/${pkgname}-${pkgver}.tar.gz")
sha512sums=('bd1e5296ea345db9ea3cd23b31add593c7f9f6eb0692d97aca04ce93078d12bdf701581189125e414f0b9c8d977cc27146adca359e0868731637ead5638c8d7a')

build() {
	cd "$pkgname-$pkgver"
	make configure PERLOPTIONS="INSTALLDIRS=vendor" STORAGECONFFILE="/etc/lemonldap-ng/lemonldap-ng.ini"
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr/share" PROD=yes install
}
