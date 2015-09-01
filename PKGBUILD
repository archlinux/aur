# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>
pkgname=kcm-wacomtablet
pkgver=2.1.0
pkgrel=2
pkgdesc="KDE GUI for the Wacom Linux Drivers"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/wacom+tablet?content=114856"
license=('GPL2')
depends=('kdebase-workspace' 'xf86-input-wacom')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/114856-wacomtablet-${pkgver}.tar.xz" \
        "set_cmake_min_req.patch")
md5sums=('fb2f3eefa6ac7e3c7b07a42ea4f6624c'
         '74f33a2c84571709b6a2c703826ab493')

prepare() {
  cd "$srcdir/wacomtablet-$pkgver"

  patch -Np1 <  "$srcdir/set_cmake_min_req.patch"
}

build() {
  cd "$srcdir/wacomtablet-$pkgver"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/wacomtablet-$pkgver"

  make DESTDIR="$pkgdir" install
}

