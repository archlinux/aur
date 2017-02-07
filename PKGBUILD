# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot  com>
pkgname=camotics-git
pkgver=1.0.6.r143.g9460571
pkgrel=1
pkgdesc="3-axis NC machining simulation software"
arch=('i686' 'x86_64')
url="http://camotics.org/"
license=('GPL2')
depends=('bzip2'
         'cairo'
         'expat'
         'glu'
         'libffi'
         'libgl'
         'libmariadbclient'
         'libunwind'
         'openssl'
         'qt4'
         'sqlite'
         'zlib')
makedepends=('boost' 'cbang-git' 'chakracore-cauldron-git' 'scons')
provides=('camotics')
replaces=('openscam')
source=("$pkgname::git+https://github.com/CauldronDevelopmentLLC/CAMotics.git"
        "camotics.desktop")
md5sums=('SKIP' 'bca9df64570c6c6e6773e8428e27cfb8')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  export CHAKRA_CORE_HOME=/opt/chakracore-cauldron-git
  export CBANG_HOME=/opt/cbang-git
  scons qt_version=4
}

package() {
  cd "$srcdir"
  install -Dm644 "camotics.desktop" \
          "$pkgdir/usr/share/applications/camotics.desktop"
  cd "$srcdir/$pkgname"
  install -Dm644 "images/camotics.png" "$pkgdir/usr/share/pixmaps/camotics.png"
  scons install compiler=gnu install_prefix="$pkgdir/usr" qt_version=4
}
