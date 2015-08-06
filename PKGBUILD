# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=keepassx2-twofish
pkgver=beta1
pkgrel=1
pkgdesc="Cross Platform Password Manager (with unofficial patches for Twofish and unlock on auto-type)"
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
        0003-Use-the-correct-cipher-for-benchmark.patch

        https://github.com/sevanteri/keepassx/commit/56eeacd573853881e10bec14616eb90a8796d840.patch
        https://github.com/sevanteri/keepassx/commit/c8f91c2ecff58359c254e07e3e49889db53f7d29.patch
        https://github.com/sevanteri/keepassx/commit/3f8aef259dd9f3b73e291ce9ee74182e7b7521a3.patch
        https://github.com/sevanteri/keepassx/commit/f242f40fcbe6ec886b7de0aab7ffde16e9b65cee.patch
        https://github.com/sevanteri/keepassx/commit/3b1d4015904c1c3abd3484784c026c411b528873.patch
        )
sha256sums=('bce1933c48fd33ef8043dd526d769fd9c454d1b63464c82a35e1f7a8689acbf2'
            '68cfe8e862e35cd022becf3c81d67d4fa5f8b77fa84543042307e50f512152cd'
            'db0b0a542fd45a7110f33cf23596c8e4bc70bee7ddf1b6f1c01a204245a1bed8'
            'f0855957af783a4f7d42331f99a539b4801015c313490cf89c004d37ec1a6f87'
            '8688632602529700f3cb74dc904d1aacb40a07cd6f19269cfbf5e0b5644c562b'
            '1c8723750894054f7cdcd0d64f0c20ec16a46d1777cc8e60b3bdcbe1f4ec14c4'
            '9b91ecda208882d54b4dfc2bf9e9dc4e4e3ac3c25ebaf9439c478d95abc65ff7'
            'a2a9b1c13f5d46e3b27318669d73782317ef67c5b4f0f154115190530b1ba97e'
            'b4bf6afb43b05f7f8274534646be2e214ade48ecec8f749890cb83abaea524cc')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

prepare() {
  local x
  cd "keepassx-2.0-$pkgver"

  patch -Np1 -i "$srcdir"/0001-Add-support-for-Twofish-in-KeePass2-code.patch
  patch -Np1 -i "$srcdir"/0002-Add-Algorithm-label-ComboBox-in-Database-settings-fo.patch
  patch -Np1 -i "$srcdir"/0003-Use-the-correct-cipher-for-benchmark.patch

  patch -Np1 -i "$srcdir"/56eeacd573853881e10bec14616eb90a8796d840.patch
  patch -Np1 -i "$srcdir"/c8f91c2ecff58359c254e07e3e49889db53f7d29.patch
  patch -Np1 -i "$srcdir"/3f8aef259dd9f3b73e291ce9ee74182e7b7521a3.patch
  patch -Np1 -i "$srcdir"/f242f40fcbe6ec886b7de0aab7ffde16e9b65cee.patch
  patch -Np1 -i "$srcdir"/3b1d4015904c1c3abd3484784c026c411b528873.patch
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
