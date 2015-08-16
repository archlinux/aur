# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=jhbuild
pkgver=20140730
pkgrel=1
pkgdesc='JHBuild allows you to automatically download and compile Gnome "modules" (i.e. source code packages).'
arch=('i686' 'x86_64')
license=('GPL')
depends=(python2)
makedepends=(rsync
             subversion
             gnome-common
             git
             intltool
             gnome-doc-utils
             yelp-tools)
install=jhbuild.install
source=('git://git.gnome.org/jhbuild'
        'module_autogenargs.patch')
sha256sums=('SKIP'
            'f92dd2735e47d0032f4069fbf1c4d1207c83eabd0a6317ea78f39d6157e854b2')
url='https://live.gnome.org/Jhbuild/'

build() {
    cd "$pkgname"

    patch -p1 < ../module_autogenargs.patch

    ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/share/jhbuild"
    cp -dr modulesets "$pkgdir/usr/share/jhbuild"
}
