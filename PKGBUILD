# Maintainer: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=pam_kwallet-git
pkgver=r58.49a5bc0
pkgrel=2
pkgdesc="PAM KWallet."
url="http://quickgit.kde.org/?p=scratch/afiestas/pam-kwallet.git"
license=('LGPL')
license=('GPL')
arch=('i686' 'x86_64')
depends=('pam' 'libgcrypt')
conflicts=('pam_kwallet-svn')
groups=('kde')
makedepends=('git' 'cmake' 'automoc4')
provides=('pam_kwallet')
source=('git://anongit.kde.org/scratch/afiestas/pam-kwallet.git')
md5sums=('SKIP')
#xinstall=kscreen-git.install

pkgver() {
  cd pam-kwallet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../pam-kwallet \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=usr/lib \
      -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
