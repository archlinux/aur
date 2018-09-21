# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Tyler Dence <tyzoid@archlinux32.org>

pkgname=nextcloud-desktop
pkgver=2.5.0
pkgrel=2
pkgdesc='Nextcloud desktop client (work-in-progress)'
arch=('i686' 'x86_64')
url='https://nextcloud.com/'
license=('GPL2')
makedepends=('cmake' 'qt5-tools' 'kio' 'doxygen' 'appstream' 'extra-cmake-modules'
             'python-sphinx' 'texlive-bin' 'texlive-core' 'texlive-latexextra' 'git')
depends=('qtkeychain' 'qt5-webkit' 'hicolor-icon-theme' 'xdg-utils' 'qt5-webengine' 'qt5-svg' 'glib2' 'sqlite')
optdepends=(
  'python2-nautilus: integration with Nautilus'
  'nemo-python: integration with Nemo'
  'kio: dolphin plugin'
)
_commit=a464ad2c712dfcec70d385b893d109f74fd30787
source=($pkgname::"git+https://github.com/nextcloud/desktop.git#commit=$_commit")
md5sums=('SKIP')

prepare() {
  cd $pkgname

  # https://gitlab.com/yan12125/aur/issues/25
  mv man/owncloud.1.rst man/nextcloud.1.rst
  mv man/owncloudcmd.1.rst man/nextcloudcmd.1.rst
}

build() {
  cd $pkgname

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
  cd $pkgname

  make DESTDIR="$pkgdir" install
}
