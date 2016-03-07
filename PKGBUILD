# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>
pkgname=kcm-wacomtablet
pkgver=3.0.0~beta1
pkgrel=1
pkgdesc="KDE GUI for the Wacom Linux Drivers"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/wacom+tablet?content=114856"
license=('GPL2')
depends=('plasma-framework' 'xf86-input-wacom')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdoctools' 'kdelibs4support')
source=("http://kde-apps.org/CONTENT/content-files/114856-wacomtablet-${pkgver}.tar.xz")
md5sums=('95d1d29063d6de2ab0881c33e8eacb05')

prepare() {
  cd "$srcdir/wacomtablet-$pkgver"

  sed -i "s|(MacroOptionalAddSubdirectory)|(ECMOptionalAddSubdirectory)|" CMakeLists.txt
  sed -i "s|macro_optional_add_subdirectory|ECM_OPTIONAL_ADD_SUBDIRECTORY|" CMakeLists.txt
}

build() {
  cd "$srcdir/wacomtablet-$pkgver"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "$srcdir/wacomtablet-$pkgver"

  make DESTDIR="$pkgdir" install
}

