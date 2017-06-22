# Maintainer: Zeph <zeph33@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-cli
pkgver=0.16
pkgrel=2
pkgdesc="Command Line (CLI) front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="https://github.com/rabbitvcs/rabbitvcs"
depends=("rabbitvcs>=$pkgver")
license=('GPL')
_gitcommit="4e94b82e34b409f0baced88521a6e03cb29c4155"
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
md5sums=('9669132c6ef3f21ecfe1fd96b9be3e0d')

package(){
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/rabbitvcs-$_gitcommit" "$srcdir/rabbitvcs-$pkgver"
  fi
	_pluginlocation="$pkgdir/usr/bin"
	
	cd "$srcdir/rabbitvcs-$pkgver/clients/cli"
	
	sed -i "s#env python#env python2#" rabbitvcs
	
	mkdir -p "$_pluginlocation"
	cp rabbitvcs "$_pluginlocation"
}
