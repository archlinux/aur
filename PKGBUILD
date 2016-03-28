# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>
# Contributor: 4javier <4javier4@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: cameel <cameel2/gmail/com>

pkgname=rednotebook
pkgver=1.12
pkgrel=1
pkgdesc="A simple desktop diary"
arch=('i686' 'x86_64')
url="http://rednotebook.sourceforge.net"
license=('GPL2')
depends=('python2-gtkspell' 'pygtk' 'python2-yaml' 'pywebkitgtk' 'hicolor-icon-theme' 'librsvg')
optdepends=('python-chardet: Python3 module for character encoding auto-detection')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d02b185060594c62aa4295d65247b706fd02cdae3c89830406e5d256e828daf8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --prefix=/usr || return 1
  
  for _res in 16 22 32 64 128; do
    install -D -m644 build/lib/rednotebook/images/rednotebook-icon/rn-${_res}.png \
    ${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png
  done
}
