# Maintainer: xiretza <xiretza+aur@gmail.com>
pkgname=lemonldap-ng
pkgver=2.0.14
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
         'perl-xml-simple' 'perl-xml-libxslt' 'perl-crypt-urandom' 'perl-json-xs'
         'perl-module-pluggable' 'perl-convert-base32' 'perl-text-unidecode' 'imagemagick'
         'perl-gssapi' 'perl-authen-radius'
)
makedepends=('uglify-js' 'python-sphinx' 'python-sphinx-bootstrap-theme')
checkdepends=('perl-test-mockobject' 'perl-test-output' 'perl-time-fake')
optdepends=('uwsgi-plugin-psgi: for running under uWSGI')
source=("https://release.ow2.org/lemonldap/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1c6e37dac5bdbddcb93323dc0ac6e6b6ccd0c62a8186e4ff7f1d4a6bf824682212f315895670b314812df9dd44dd5f370de37a631efa169db2b44687c2da2c98')

prepare() {
	cd "$pkgname-$pkgver"
	make configure PERLOPTIONS="INSTALLDIRS=vendor" STORAGECONFFILE="/etc/lemonldap-ng/lemonldap-ng.ini"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr/share" PROD=yes install
}
