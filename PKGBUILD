# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration-git
_pkgname=linux-steam-integration
pkgver=0.3.r0.ge3360b7
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('linux-steam-integration')
conflicts=('linux-steam-integration')
source=("git+https://github.com/solus-project/linux-steam-integration.git"
        "git+https://github.com/ikeydoherty/libnica.git")
sha512sums=('SKIP'
         'SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  git config submodule.src/libnica.url $srcdir/libnica
  git submodule update
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh --enable-frontend --disable-replace-steam
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
