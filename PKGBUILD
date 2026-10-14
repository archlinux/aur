# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cqrlogo
pkgver=0.5.6
pkgrel=1
pkgdesc='CGI QR-Code logo for web services'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/cqrlogo'
depends=('iniparser' 'libpng' 'qrencode')
makedepends=('git' 'fcgi' 'discount')
optdepends=('apache: for apache web server inclusion'
	'fcgi: for FastCGI version'
	'lighttpd: for lighttpd web server inclusion'
	'mod_fastcgi: for fastcgi in apache web server'
	'mod_fcgid: for fastcgi in apache web server')
conflicts=('cqrlogo-git')
checkdepends=('zbar' 'pngcheck')
license=('GPL')
install=cqrlogo.install
backup=('etc/cqrlogo.conf'
	'etc/httpd/conf/extra/cqrlogo.conf'
	'etc/lighttpd/conf.d/cqrlogo.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/cqrlogo.git?signed#tag=${pkgver}")
sha256sums=('df9125c59c29d5c3f873ea734ae6c64a592844f69a5e6a366703d6821923328f')

build() {
	cd ${pkgname}/

	make VERSION="${pkgver}-${pkgrel}"
}

check() {
	cd ${pkgname}/

	make check
}

package() {
	cd ${pkgname}/

	make DESTDIR="${pkgdir}" install
}

