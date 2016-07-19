# Maintainer: Luca Weiss <WEI16416@spengergasse.at>
 
pkgname=linux-steam-integration-git
_pkgname=linux-steam-integration
pkgver=0.2.r2.g00d8831
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('gtk3')
makedepends=('git')
#provides=("steam") ? I don't know what I should do because this wants to move the normal steam binary...
#conflicts=("steam")
source=("git+https://github.com/solus-project/linux-steam-integration.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  ./autogen.sh --enable-frontend 
}

build() {
  cd $srcdir/$_pkgname
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

