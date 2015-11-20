# Maintainer: Justin R. St-Amant <jstamant24 at gmail dot  com>
pkgname=camotics-git
pkgver=1.0.6.r15.ga799aa8
pkgrel=1
pkgdesc="3-axis NC machining simulation software"
arch=('i686' 'x86_64')
url="http://camotics.org/"
license=('GPL2')
depends=('boost-libs'
         'bzip2'
         'cairo'
         'expat'
         'glu'
         'libffi'
         'libgl'
         'libmariadbclient'
         'openssl'
         'qt5-base'
         'sqlite'
         'v8-3.14'
         'zlib')
makedepends=('boost' 'scons')
provides=('camotics')
replaces=('openscam')
source=("$pkgname::git+https://github.com/CauldronDevelopmentLLC/CAMotics.git"
        "git+https://github.com/CauldronDevelopmentLLC/cbang.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/cbang"
  scons
  export CBANG_HOME=$PWD

  cd "$srcdir/$pkgname"
  scons
}

package() {
  cd "$srcdir/$pkgname"
  scons install compiler=gnu install_prefix="$pkgdir/usr"
}
