# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=mosh-git
pkgver=20191002
pkgrel=1
pkgdesc="Mobile shell, surviving disconnects with local echo and line editing, development version"
arch=('i686' 'x86_64' 'arm')
url="http://mosh.mit.edu/"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
makedepends=('git')
optdepends=('perl-io-socket-ip: for IPv6 support')
conflicts=('mosh')
source=('git+https://github.com/mobile-shell/mosh.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/mosh"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/mosh"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/mosh"
  make DESTDIR="${pkgdir}" install
}
