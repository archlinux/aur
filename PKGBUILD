# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot  com>
pkgname=camotics
pkgver=1.1.0
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
source=("https://github.com/CauldronDevelopmentLLC/$pkgname/archive/v$pkgver.tar.gz"
        "camotics.desktop")
md5sums=('fdb06d795a54be5deb15f5341275f25f'
         'bca9df64570c6c6e6773e8428e27cfb8')
prepare() {
  cd "$srcdir"
  mv "CAMotics-$pkgver" "$pkgname"
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
