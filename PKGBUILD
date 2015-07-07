# Maintainer: Lari <lartza at wippies.com<
# Contributor: Uwe <keksvernichter at gmail.com> 
pkgname=mpn
pkgver=1.1
pkgrel=2
pkgdesc="MPNotifier is a lightweight client for MPD displaying a popup notification each time a new song is played"
arch=('any')
url="http://chadok.info/mpn/"
license=('GPL2')
depends=('python2-notify' 'python2-mpd' 'pygtk' 'python2-yaml')
install=mpn.install
source=(http://chadok.info/mpn/MPNotifier-$pkgver.tar.gz
	http://chadok.info/darcs/mpn/mpnrc
	http://chadok.info/darcs/mpn/COPYING)
md5sums=('b16ab662f5b8eebd1ad8f32b90a3da8f'
         'e3a696c3e25a6d1a84665d7c09abfda9'
         'b234ee4d69f5fce4486a80fdaf4a4263')

build() {
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mkdir -p ${pkgdir}/usr/bin

  sed -i "s#/usr/bin/python#/usr/bin/python2#" ${srcdir}/MPNotifier-${pkgver}/mpn
}

package() {
  install -D -m755 ${srcdir}/MPNotifier-${pkgver}/mpn ${pkgdir}/usr/bin/mpn
  install -D -m644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  install -D -m744 ${srcdir}/mpnrc ${pkgdir}/usr/share/doc/${pkgname}/mpnrc.sample
}
