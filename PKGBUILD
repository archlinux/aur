# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=gtk-kde4
pkgver=0.9.5b
pkgrel=2
pkgdesc='Allows you to change style, icons, font of GTK applications in KDE4.'
arch=('i686' 'x86_64')
url='http://kde-look.org/content/show.php?content=74689'
license=('GPL')
depends=('kdebase-workspace' 'gtk-engines')
makedepends=('cmake' 'automoc4')
provides=('gtk-qt-engine')
source=("http://kde-look.org/CONTENT/content-files/74689-gtk-kde4(src)0.9.5.tar.gz"
        'fix-permission.patch')
md5sums=('d5998e4ccd4bd4b4d6a61e7afe8bbecb'
         'f52fa3288c728e5fad72c5d136b49bc5')

build() {
  cd ${pkgname}

  patch -p1 -i ${srcdir}/fix-permission.patch
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${pkgname}

  make DESTDIR=${pkgdir} install
}
