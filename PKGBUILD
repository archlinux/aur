# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>
# Contributor: 4javier <4javier4@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: cameel <cameel2/gmail/com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rednotebook
pkgver=1.14
pkgrel=3
pkgdesc="A simple desktop diary"
arch=('any')
url="http://rednotebook.sourceforge.net"
license=('GPL2')
depends=('python2' 'hicolor-icon-theme')
optdepends=('python-chardet: Python3 module for character encoding auto-detection'
	   'python2-gtkspellcheck: for spellchecking')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f33bd410ae01d064c1e449c532359ce1c134169d44a97d74ef1e99ff8d287d88')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --prefix=/usr
  
  for _res in 16 22 32 64 128; do
    install -D -m644 build/lib/rednotebook/images/rednotebook-icon/rn-${_res}.png \
    ${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png
  done
}
