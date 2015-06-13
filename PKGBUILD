# $Id: PKGBUILD 126165 2015-01-18 21:36:14Z jelle $
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer:  Jon Ribeiro <contact@jonathas.com>

pkgname=parano
pkgver=0.3.5
pkgrel=6
pkgdesc="A GNOME frontend for creating/editing/checking MD5 and SFV files"
arch=('any')
url="http://sourceforge.net/projects/parano.berlios/"
license=('GPL')
depends=('python2-libgnome' 'shared-mime-info' 'desktop-file-utils')
makedepends=('intltool')
install=parano.install
source=(http://ftp.cc.uoc.gr/mirrors/linux/frugalware/frugalware-testing/source/gnome-extra/parano/parano-0.3.5.tar.gz)
md5sums=('126cc42492c1dcf4c5e1b4a3c616acb6')

build() {
	cd ${srcdir}/parano-${pkgver}

    # python2 fix
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

	./configure --prefix=/usr --disable-update-mime-database
	make
}

package() {
	cd ${srcdir}/parano-${pkgver}

	make DESTDIR=${pkgdir} install
}

