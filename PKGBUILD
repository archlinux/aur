# Maintainer: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>

pkgname=pam_kwallet-git
pkgver=r69.91ae142
pkgrel=4
pkgdesc="PAM KWallet."
url="http://quickgit.kde.org/?p=scratch/afiestas/pam-kwallet.git"
license=('LGPL')
license=('GPL')
arch=('i686' 'x86_64')
depends=('pam' 'libgcrypt' 'socat')
conflicts=('pam_kwallet-svn')
groups=('kde')
makedepends=('git' 'cmake' 'automoc4')
provides=('pam_kwallet')
source=('git://anongit.kde.org/kwallet-pam')
md5sums=('SKIP')

pkgver() {
  cd kwallet-pam
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build-kde4
  mkdir -p build-kde5
}

build() {
  pushd build-kde4
  cmake ../kwallet-pam \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_LIBDIR=usr/lib \
  -DKWALLET4=1
  make
  popd

  pushd build-kde5
  cmake ../kwallet-pam \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_LIBDIR=usr/lib
  make
  popd
}

package() {
  make -C build-kde4 DESTDIR="${pkgdir}" install
  make -C build-kde5 DESTDIR="${pkgdir}" install
}
