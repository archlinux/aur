# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=spawn-fcgi-php
pkgver=1.2
pkgrel=1
pkgdesc="Script to provide simple cgi-php support for nginx http daemon"
arch=('any')
url="http://aur.archlinux.org/packages.php?ID=37439"
license=('GPL')
depends=('php-cgi' 'spawn-fcgi')
backup=('etc/conf.d/spawn-fcgi-php.conf')
source=(
  'spawn-fcgi-php.rc.d'
  'spawn-fcgi-php.conf'
  'spawn-fcgi-php.service'
  'spawn-fcgi-php.script'
  'server.conf.example'
  'nginx.conf.example'
  'public_html.conf.example'
)
options=(!strip)

build() {
	# Install script and configuration file
	install -Dm755 "$srcdir"/spawn-fcgi-php.rc.d \
		"$pkgdir"/etc/rc.d/spawn-fcgi-php
	install -Dm644 "$srcdir"/spawn-fcgi-php.conf \
		"$pkgdir"/etc/conf.d/spawn-fcgi-php.conf

  # Install systemd's files
  install -Dm755 "$srcdir"/spawn-fcgi-php.script \
    "$pkgdir"/usr/lib/systemd/scripts/spawn-fcgi-php
  install -Dm644 "$srcdir"/spawn-fcgi-php.service \
    $pkgdir/usr/lib/systemd/system/spawn-fcgi-php.service


	# Install examples of configuration
	install -Dm644 "$srcdir"/public_html.conf.example \
		"$pkgdir"/etc/nginx/public_html.conf.example
	install -Dm644 "$srcdir"/server.conf.example \
		"$pkgdir"/etc/nginx/conf/server.conf.example
  	install -Dm644 nginx.conf.example \
		"$pkgdir"/etc/nginx/conf/nginx.conf.example
}
md5sums=('fefc431b8fc180b3a68e597cbff5cb3a'
         '58e5db0b9d10b2e2fb4784a42daffd03'
         '300a6f174a552ab1981ccf7607615904'
         '44e4278c673e63f1033f5fe23463b26e'
         'f7d68bcf67a05b39ead0c9ec8f87d863'
         '8f0aa0bd87e43e3684e0367c6d8682b1'
         'f3bf2492b92224d71cc441e439721adc')
