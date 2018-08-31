# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Joeny Ang <ang.joeny@gmail.com>
# Contributor: Zaler <zldream1011@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dies <JerryCasiano@gmail.com>

pkgname=font-manager-git
_branch=testing
pkgver=0.7.3.r41.geb9c114
pkgrel=1
pkgdesc='A simple font management application for GTK+ Desktop Environments'
url='http://fontmanager.github.io'
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
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
