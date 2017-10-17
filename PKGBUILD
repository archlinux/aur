# Contributor: honzor <dorhonzor@gmail.com>
pkgname=veejay-utils-git
_name=veejay-utils
_pkgroot=veejay
pkgver=1.5.57.r984.g560172d7
pkgrel=1
pkgdesc="Veejay is a visual instrument and realtime video sampler for GNU/Linux"
arch=('i686' 'x86_64')
url="https://github.com/c0ntrol/${_pkgroot}"
groups=('veejay')
conflicts=('veejay-utils')
replaces=('veejay-utils')
provides=('veejay-utils')
license=('LGPL')
depends=('veejay-server' 'veejay-client')
makedepends=('git')
source=("${_name}::git+https://github.com/c0ntrol/${_pkgroot}")
sha512sums=('SKIP')

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
