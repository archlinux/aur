# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=grub2-editor-frameworks
pkgver=20180827.ga7ad1d9
pkgrel=1
pkgdesc="A KDE Control Module for configuring the GRUB2 bootloader. Unofficial KF5 port."
arch=('i686' 'x86_64')
url='https://github.com/maz-1/grub2-editor'
license=('GPL')
provides=(grub2-editor)
conflicts=(grub2-editor)
depends=('grub' 'hwinfo' 'imagemagick'
         'qt5-base'
         'kio' 'ki18n' 'kauth' 'kconfigwidgets' 'solid')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
optdepends=('os-prober: Create entries for other operating systems')
source=("git+https://github.com/maz-1/grub2-editor.git")
groups=('plasma')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/grub2-editor"
  echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
}

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake ../grub2-editor \
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
