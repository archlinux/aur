# Maintainer: leaeasy <leaeasy at gmail.com>

pkgname=konsole-blurry
_pkgname=konsole
pkgver=18.04.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Konsole with blurry support"
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdebase')
conflicts=('konsole')
provides=('konsole')
depends=('knotifyconfig' 'kpty' 'kparts')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
optdepends=('kdebase-keditbookmarks: to manage bookmarks')
replaces=('kdebase-konsole')
conflicts=('kdebase-konsole<4.14.3-2')
source=("http://download.kde.org/stable/applications/${pkgver}/src/konsole-${pkgver}.tar.xz" 
        "0001-add-blur-effect-when-set-transparency.patch"
        "0002-add-rainbows-support.patch"
        "0003-fix-qttab-default-style.patch")
sha1sums=('b7b3ef35d3575d6a544e8b9f8a3f37d201f6f77c'
	'c130165b09c0fe1b7ec81342ab6d33576a67e82b'
	'7eaa9b5a47e7d824283481c8c6262b6b78295813'
	'78348b2a4c2c2e9dc5d97b06d7f99c52aff1c9a8')

prepare() {
  mkdir -p build
  cd ${srcdir}/$_pkgname-$pkgver
  patch -Np1 -i ${srcdir}/0001-add-blur-effect-when-set-transparency.patch
  patch -Np1 -i ${srcdir}/0002-add-rainbows-support.patch
  patch -Np1 -i ${srcdir}/0003-fix-qttab-default-style.patch
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
