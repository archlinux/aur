# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=isoimagewriter
pkgver=0.1
pkgrel=1
pkgdesc="A program to write hybrid ISO files onto a USB disk from Linux, Mac or Windows ready to boot."
arch=("x86_64" "i686")
url="https://community.kde.org/ISOImageWriter"
license=('GPL3')
depends=('ki18n' 'kauth' 'qgpgme')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("https://download.kde.org/unstable/isoimagewriter/0.1/isoimagewriter-0.1.tar.xz"{,.sig}
        fix_build.patch)
sha512sums=('3a11772b916438dd1683dec8e9bf60aa88e2db8cbd06dc5c8044531108baf6a01fbb37176b4722024a0c9a466394988dcd800ecad9b6f642093e988b85e39a2f'
            'SKIP'
            '6cdb771a4c54f59d6884fa1d43ad4c913c91e86437de9255ec6ed133179d84f8bf44509fa7682ac7b70166e48a1d010371a637ec8756a1e40d631396878d477a')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E') # Jonathan Riddell

prepare() {
  mkdir -p build
  cd $pkgname-$pkgver
  patch -Np0 < $srcdir/fix_build.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
