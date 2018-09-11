# Maintainer: Tyler Dence <tyzoid@archlinux32.org>

pkgname=nextcloud-desktop
pkgver=2.5.0
pkgrel=1
pkgdesc='Nextcloud desktop client (work-in-progress)'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
makedepends=('cmake' 'qt5-tools' 'kio' 'doxygen' 'appstream' 'extra-cmake-modules'
             'python-sphinx' 'texlive-bin' 'texlive-core' 'texlive-latexextra')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils' 'qt5-webengine' 'qt5-svg' 'glib2' 'sqlite')
optdepends=(
  'python2-nautilus: integration with Nautilus'
  'nemo-python: integration with Nemo'
  'kio: dolphin plugin'
)
_commit=90d391748197777c8b674e6e09cf78e571ce07c0
source=($pkgname::"git+https://github.com/nextcloud/desktop.git#commit=$_commit?signed")
md5sums=('SKIP')
validpgpkeys=(A26B951528EA1BA1678C7AE5D406C75CEE1A36D6)  # Camila Ayres (@camilasan)

build() {
  cd $pkgname

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc/$pkgname \
    .

  make
  make doc
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
}
