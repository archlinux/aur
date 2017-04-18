# Maintainer: David Thurstenson <thurstylark@gmail.com>
pkgname=chirp-hg
pkgver=r2879.2c4bb936f964
epoch=1
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from hg repo"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk' 'curl')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=('mercurial')
provides=('chirp')
conflicts=('chirp')
source=('hg+http://d-rats.com/hg/chirp.hg')
md5sums=('SKIP')

pkgver() {
	cd chirp.hg
	hg tip --template 'r{rev}.{node|short}'
}

prepare() {
	sed -i 's|/usr/sbin|/usr/bin|' chirp.hg/setup.py
}

package() {
	cd chirp.hg
	python2 setup.py install --root="$pkgdir" --optimize=1
}
