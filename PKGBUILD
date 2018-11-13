# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Tyler Dence <tyzoid@archlinux32.org>

pkgname=nextcloud-desktop
pkgver=2.5.0
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
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/nextcloud/desktop/archive/v$pkgver.tar.gz")
sha256sums=('4d639f43e49fd4367cd1b99bf21aecb2eac3bd89a7b0d96c7d2a0975baad6528')

prepare() {
  cd desktop-$pkgver

  # https://github.com/nextcloud/desktop/issues/699
  mv man/owncloud.1.rst man/nextcloud.1.rst
  mv man/owncloudcmd.1.rst man/nextcloudcmd.1.rst
}

build() {
  cd desktop-$pkgver

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
  cd desktop-$pkgver

  make DESTDIR="$pkgdir" install
}
