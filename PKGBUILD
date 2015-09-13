# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=komparator4
pkgver=1.0
pkgrel=1
pkgdesc='An application for KDE4 that searches and synchronizes two directories.'
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/komparator4?content=116039'
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=("http://kde-apps.org/CONTENT/content-files/116039-${pkgname}-${pkgver}.tar.bz2")
md5sums=('d78648dfd45dfec0ec8eb161da98ea73')

build(){
  cd "$pkgname-$pkgver"
  sed -i 's_dtd/kdex.dtd_/usr/share/apps/ksgmltools2/customization/dtd/kdex.dtd_' doc/index.docbook
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

