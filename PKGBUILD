# Maintainer: FloTheSysadmin <FloTheSysadmin@protonmail.com>
pkgname=wirelogd
pkgver=2.1.0
pkgrel=1
pkgdesc='A logging daemon for WireGuard'
url='https://github.com/nikaro/wirelogd'
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikaro/wirelogd/archive/refs/tags/${pkgver}.tar.gz")
arch=('x86_64')
makedepends=('go')
license=('GPL-3.0-or-later')
sha256sums=('1cffa33531549c94d71fc09c7a2d2ed32a067172ad06c147ef9a5975c95ff051')
install='wirelogd.install'

build ()
{
  cd $pkgname-$pkgver
  make
}

package ()
{

  mkdir -p "${pkgdir}/usr/bin"  
  mkdir -p "${pkgdir}/etc/wirelogd"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"

  install -m 644 $pkgname-$pkgver/contrib/config.json "${pkgdir}/etc/wirelogd/"
  install -m 644 $pkgname-$pkgver/contrib/wirelogd.service "${pkgdir}/usr/lib/systemd/system/"
  install -m 755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}-linux-amd64" "${pkgdir}/usr/bin/${pkgname}"

}