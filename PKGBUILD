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
        0002-Add-Algorithm-label-ComboBox-in-Database-settings-fo.patch
        0003-Use-the-correct-cipher-for-benchmark.patch)
sha256sums=('bce1933c48fd33ef8043dd526d769fd9c454d1b63464c82a35e1f7a8689acbf2'
            '68cfe8e862e35cd022becf3c81d67d4fa5f8b77fa84543042307e50f512152cd'
            'db0b0a542fd45a7110f33cf23596c8e4bc70bee7ddf1b6f1c01a204245a1bed8'
            'f0855957af783a4f7d42331f99a539b4801015c313490cf89c004d37ec1a6f87')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

prepare() {
  cd "keepassx-2.0-$pkgver"

  patch -Np1 -i "$srcdir/0001-Add-support-for-Twofish-in-KeePass2-code.patch"
  patch -Np1 -i "$srcdir/0002-Add-Algorithm-label-ComboBox-in-Database-settings-fo.patch"
  patch -Np1 -i "$srcdir/0003-Use-the-correct-cipher-for-benchmark.patch"
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
