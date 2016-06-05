# $Id: PKGBUILD 172186 2016-04-27 20:47:53Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>
# Contributor: Le_J <clej37 at gmail dot com>

pkgname=ktikz
pkgver=0.10
pkgrel=9
pkgdesc="A small application helping you to create TikZ diagrams (from the LaTeX pgf package)"
arch=('i686' 'x86_64')
url="http://www.hackenberger.at/blog/ktikz-editor-for-the-tikz-language/"
license=('GPL')
depends=('poppler-qt4' 'kdebase-runtime')
makedepends=('automoc4' 'cmake' 'docbook-xml')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ktikz_$pkgver.orig.tar.gz")
md5sums=('e8f0826cba2447250bcdcd389a71a2ac')

prepare() {
# Fix build
  sed -e 's|\\\\\\||g' -i ktikz/app/CMakeLists.txt
}

build() {
  cd $pkgname

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
