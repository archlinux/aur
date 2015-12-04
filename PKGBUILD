# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=grub2-editor-frameworks
pkgver=0.6.4
pkgrel=1
pkgdesc="A KDE Control Module for configuring the GRUB2 bootloader.Unofficial KF5 port."
arch=('i686' 'x86_64')
url='https://ksmanis.wordpress.com/projects/grub2-editor/'
license=('GPL')
provides=grub2-editor
conflicts=grub2-editor
depends=('grub' 'hwinfo' 'imagemagick'
         'qt5-base'
         'kio' 'ki18n' 'kauth' 'kconfigwidgets' 'solid')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("http://sourceforge.net/projects/kcm-grub2/files/kcm-grub2-$pkgver.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/maz-1/grub2-editor/pull/1.diff")
groups=('plasma')
md5sums=('b3ff8fb938be8112dcc6e42b3e56efc6'
         'SKIP')


prepare() {
  rm -rf build
  mkdir -p build
  cd kcm-grub2-$pkgver
  patch -p1 -i "$srcdir/1.diff"
}

build() {
  cd build
  cmake ../kcm-grub2-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
