# Maintainer: Lubosz Sarnecki <lubosz at gmail com>

pkgname=gletools-hg
pkgver=20101219
pkgrel=1
pkgdesc="Advanced opengl utilities for pyglet."
arch=(any)
url="http://codeflow.org"
license=('custom:AGPL3')
depends=('python2' 'pyglet-hg')
makedepends=('python2-distribute' 'mercurial')
conflicts=('gletools')
provides=('gletools')
source=()
md5sums=()

_hgbranch=http://hg.codeflow.org/gletools
_hgrepo=gletools

build() {
	cd ${srcdir}

	if [ -d ${_hgrepo} ]; then
		(cd ${_hgrepo} && hg pull -u) || return 1
	else
		hg clone ${_hgbranch} || return 1
	fi

	msg "Mercurial clone done or server timeout"
	
	cd ${_hgrepo}
  
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
