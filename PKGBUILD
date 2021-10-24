# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>
# Contributor: moormaster <moormaster AT gmx DOT net>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname='gnome-activity-journal'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Activity Journal for the GNOME desktop environment'
arch=('any')
url="https://gitlab.gnome.org/crvi/${pkgname}"
license=('GPL')
depends=('python-gobject' 'dbus-python' 'python-pyxdg' 'zeitgeist')
makedepends=('python-distutils-extra')
optdepends=('python-pygments: get thumbnail of text files')
source=("https://gitlab.gnome.org/crvi/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.appdata.xml")
validpgpkeys=('7C0FF088052C082B442454171CFC22F3363DEAE3') # Siegfried-Angel Gevatter Pujals
sha256sums=('826bdb64eca9cf54abbe29feec2e55066244d3b6b0dd618c57f64c95a367d967'
            '2a8f952608851258c07c92d3bbececfa7572dc7e5609c4aa49298e098d102207')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 ../"${pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"
	rm -r "${pkgdir}/usr/share/pixmaps"
}

