# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Tyler Dence <tyzoid@archlinux32.org>

pkgname=nextcloud-desktop
_pkgver=2.5.0-rc2
pkgver=2.5.0rc2
pkgrel=1
epoch=1
pkgdesc='Nextcloud desktop client (work-in-progress)'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
makedepends=('cmake' 'qt5-tools' 'kio' 'doxygen' 'appstream' 'extra-cmake-modules'
             'python-sphinx' 'texlive-bin' 'texlive-core' 'texlive-latexextra' 'git')
depends=('qtkeychain' 'qt5-webkit' 'xdg-utils' 'qt5-webengine' 'qt5-svg' 'glib2' 'sqlite')
optdepends=(
  'python2-nautilus: integration with Nautilus'
  'nemo-python: integration with Nemo'
  'kio: dolphin plugin'
)
source=("$pkgname-$_pkgver.tar.gz"::"https://github.com/nextcloud/desktop/archive/v$_pkgver.tar.gz")
sha256sums=('835efaa1bff4462221930ab7c1dcf820d232e03beec1b8fecea8c7abd18e8687')

prepare() {
  cd desktop-$_pkgver

  # https://github.com/nextcloud/desktop/issues/699
  mv man/owncloud.1.rst man/nextcloud.1.rst
  mv man/owncloudcmd.1.rst man/nextcloudcmd.1.rst
}

build() {
  cd desktop-$_pkgver

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc/$pkgname \
    .

  make
  make doc
  make doc-man
}

package() {
  cd desktop-$_pkgver

  make DESTDIR="$pkgdir" install
}
