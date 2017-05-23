# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Dmitry Korzhevin <dkorzhevin at gmail dot com>
# Contributor: 4javier <4javier4@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: cameel <cameel2/gmail/com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: SanskritFritz (gmail)

pkgname=rednotebook-git
_gitname="rednotebook"
pkgver=v2.0.r4.gae67507
pkgrel=1
pkgdesc="A simple desktop diary."
arch=('any')
url="http://rednotebook.sourceforge.net"
license=('GPL2')
depends=('python-yaml' 'pywebkitgtk' 'hicolor-icon-theme')
optdepends=('python-chardet: Python module for character encoding auto-detection'
            'python-gtkspellcheck: for spellchecking')
provides=('rednotebook')
conflicts=('rednotebook')
source=("git://github.com/jendrikseipp/rednotebook.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"
	python setup.py build
}

package() {
	cd "$_gitname"
	python setup.py install --root="${pkgdir}" --prefix=/usr
  
	for _res in 16 22 32 64 128; do
		install -D -m644 build/lib/rednotebook/images/rednotebook-icon/rn-${_res}.png \
		${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png
	done
}
