# Contributor: honzor <dorhonzor@gmail.com>
pkgname=veejay-utils-git
_name=veejay-utils
_pkgroot=veejay
pkgver=1.5.51.r35.gedd474e
pkgrel=1
pkgdesc="Veejay is a visual instrument and realtime video sampler for GNU/Linux"
arch=('i686' 'x86_64')
url="http://www.veejayhq.net"
groups=('veejay')
conflicts=('veejay-utils')
replaces=('veejay-utils')
provides=('veejay-utils')
license="LGPL"
depends=('veejay-server')
makedepends=('git')
source=("${_name}::git+git://code.dyne.org/veejay.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}/${_pkgroot}-current"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/${_name}/${_pkgroot}-current/${_name}"
  ./autogen.sh
  ./configure --prefix=/usr
  make 2>&1 | tee build.log
}

package() {
  cd "$srcdir/${_name}/${_pkgroot}-current/${_name}"
  make DESTDIR="$pkgdir" install
}
