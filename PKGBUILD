# Author: Dies <JerryCasiano(at)gmail(dot)com>
# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Zaler <zldream1011(at)gmail(dot)com>
# Contributor: joni <kljohann(at)gmail(dot)com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=font-manager-git
_branch=testing
pkgver=0.7.3.r36.ga299ee3
pkgrel=1
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgee' 'libxml2' 'sqlite' 'gucharmap' 'file-roller')
makedepends=('git' 'gnome-common' 'automake' 'intltool' 'yelp-tools' 'gobject-introspection' 'vala')
install=font-manager.install
provides=('font-manager')
conflicts=('font-manager')
source=("${pkgname}::git://github.com/FontManager/master.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make -j1
}

package() {
  cd ${pkgname}

  make DESTDIR=${pkgdir} install
}
