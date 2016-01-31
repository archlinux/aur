# Maintainer: zoe <chp321 AT gmail DOT com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=etoys
pkgver=5.0.2408
_realver=5.0.2408
pkgrel=2
pkgdesc="Educational tool for teaching children powerful ideas in compelling ways. For Sugar"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sucrose' 'glucose')
depends=('sugar' 'squeak-vm' 'shared-mime-info')
install=etoys.install
source=("http://download.sugarlabs.org/sources/sucrose/glucose/${pkgname}/${pkgname}-${_realver}.tar.gz"
        "${pkgname}.desktop" "${pkgname}.png")
md5sums=('c79ee59d8e100cfc2934af8da90519b5'
         '14de8b52fee032ad3065cf52a1eddb8c'
         '78db4db90ebf3bee26d66758096dcaa5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  install -DTm644 ${srcdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/80x80/apps/${pkgname}.png"
  install -DTm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cd "${srcdir}/${pkgname}-${pkgver}"
  make ROOT="$pkgdir" install-etoys install-activity || return 1
}