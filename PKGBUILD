# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=keepassx2-twofish
pkgver=beta1
pkgrel=1
pkgdesc="Cross Platform Password Manager (with unofficial patches for Twofish)"
arch=('i686' 'x86_64')
url="https://www.keepassx.org/dev/"
license=('GPL2' 'GPL3')
depends=('shared-mime-info' 'libxtst' 'qt4')
makedepends=('intltool' 'cmake')
conflicts=('keepassx' 'keepassx2-git' 'keepassx2')
options=(!emptydirs)
install=keepassx2.install
source=("https://www.keepassx.org/dev/attachments/download/100/keepassx-2.0-${pkgver}.tar.gz"
        0001-Add-support-for-Twofish-in-KeePass2-code.patch
        0002-Add-Algorithm-label-ComboBox-in-Database-settings-fo.patch)
sha256sums=('bce1933c48fd33ef8043dd526d769fd9c454d1b63464c82a35e1f7a8689acbf2'
            '901d4dff35f9e21c77cbd0dfe962ca00873c85cb1566bcccfd6492cada94220f'
            '99a52bb7f2b9b0c00690a5243d74c09667cc2d6f7580ecfc45b6fd4961a7dfb6')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

prepare() {
  cd "keepassx-2.0-$pkgver"

  patch -Np1 -i "$srcdir/0001-Add-support-for-Twofish-in-KeePass2-code.patch"
  patch -Np1 -i "$srcdir/0002-Add-Algorithm-label-ComboBox-in-Database-settings-fo.patch"
}

build() {
  cd "keepassx-2.0-$pkgver"

  mkdir -p build
  cd build

  cmake $_cmake_keys ..
  make
}

package() {
  cd "keepassx-2.0-$pkgver/build"

  make DESTDIR="${pkgdir}" install
}
