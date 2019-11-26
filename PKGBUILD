# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>
# Contributor: 4javier <4javier4@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: cameel <cameel2/gmail/com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: SanskritFritz (gmail)

pkgname=rednotebook
pkgver=2.14
pkgrel=2
pkgdesc="A simple desktop diary."
arch=('any')
url="http://rednotebook.sourceforge.net"
license=('GPL2')
depends=('python-yaml' 'webkit2gtk' 'hicolor-icon-theme' 'python-gobject' 'gtksourceview3')
optdepends=('python-pyenchant: for spellchecking')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c26ca57af50d99908a26ce9eaa952a6899efc7cc1e44ac3fe182abb5a981c9ca')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python setup.py install --root="${pkgdir}" --prefix=/usr
  
	for _res in 16 22 32 64 128; do
		install -D -m644 build/lib/rednotebook/images/rednotebook-icon/rn-${_res}.png \
		${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png
	done
}
