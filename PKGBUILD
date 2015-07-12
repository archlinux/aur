# Author: Dies <JerryCasiano(at)gmail(dot)com> 
# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Zaler <zldream1011(at)gmail(dot)com>
# Contributor: joni <kljohann(at)gmail(dot)com>

pkgname=font-manager-git
_gitname=master
pkgver=0.r148.91c509c
pkgrel=2
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgee' 'libxml2' 'sqlite' 'gucharmap' 'file-roller')
makedepends=('git' 'gnome-common' 'automake' 'intltool' 'yelp-tools' 'gobject-introspection' 'vala')
install=font-manager.install
provides=('font-manager')
conflicts=('font-manager')
source=("git+https://github.com/FontManager/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  
  # git describe can't describe anything without tags
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}

  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make -j1
}

package() {
  cd ${srcdir}/${_gitname}

  make DESTDIR=${pkgdir} install
}
