
_pkgname=x-tile
pkgname=${_pkgname}-git
pkgver=2.6.r3.gbc2ffd3
pkgrel=1
pkgdesc="X-tile is an application that allows you to select a number of windows and tile them in different ways. It works on any X desktop (gnome, kde, xfce, lxde…)."
arch=(any)
url=http://www.giuspen.com/$_pkgname
license=(GPL2)

#depends=('hicolor-icon-theme' 'pygtk' 'python2-libappindicator')
depends=('gconf' 'libappindicator-gtk3' 'python2-gobject')
makedepends=('git' 'python2-distutils-extra')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/giuspen/${_pkgname}.git")
sha256sums=('SKIP')

prepare() {
        cd "${srcdir}/${_pkgname}"
        sed -i 's%#!/usr/bin/env python%#!/usr/bin/env python2%g' setup.py
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    echo "python script, so nothing to build :) "
}

package() {
	cd "${srcdir}/${_pkgname}"

	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}


