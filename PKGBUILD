#! /bin/bash
# Maintainer: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon

pkgname=nicotine-plus-git
_gitname=nicotine-plus
pkgver=1.4.1.r17.g8b2c199
pkgrel=1
pkgdesc="A fork of Nicotine, a graphical client for Soulseek."
arch=('any')
url="http://nicotine-plus.org"
license=('GPL3')
depends=('pygtk' 'gtk2' 'mutagen')
makedepends=('git' 'python2')
optdepends=('miniupnpc: To enable UPnP support'
	'python2-geoip: To enable geo-blocker'
	'python2-notify: Notification support')
source=(git+https://github.com/Nicotine-Plus/${_gitname}.git)
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_gitname"
	python2 setup.py install --root=$srcdir/pkg
}

package() {
	mv ${srcdir}/pkg/* ${pkgdir}
}

