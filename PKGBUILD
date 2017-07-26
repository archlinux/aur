#! /bin/bash
# Maintainer: Rafael Cavalcanti <rc.cavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon

pkgname=nicotine-plus-git
_gitname=nicotine-plus
pkgver=r2105.e91f0e9
pkgrel=3
pkgdesc="A fork of Nicotine, a graphical client for Soulseek."
arch=('i686' 'x86_64')
url="http://nicotine-plus.org"
license=('GPL')
depends=('pygtk' 'gtk2' 'mutagen')
makedepends=('git' 'python2')
optdepends=('miniupnpc: To enable UPnP support'
	'python2-geoip: To enable geo-blocker'
	'python2-notify: Notification support')
source=(git+https://github.com/Nicotine-Plus/${_gitname}.git)
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	python2 setup.py install --root=$srcdir/pkg
}

package() {
	mv ${srcdir}/pkg/* ${pkgdir}
}
