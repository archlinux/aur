# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Joeny Ang <ang.joeny@gmail.com>
# Contributor: Zaler <zldream1011@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dies <JerryCasiano@gmail.com>

pkgname=font-manager-git
_branch=master
pkgver=0.7.4.r0.gc202c8c
pkgrel=1
pkgdesc='A simple font management application for GTK+ Desktop Environments'
url='http://fontmanager.github.io'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'sqlite')
optdepends=('file-roller')
makedepends=('git' 'gnome-common' 'yelp-tools' 'gobject-introspection' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git://github.com/FontManager/master.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make -j1
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
