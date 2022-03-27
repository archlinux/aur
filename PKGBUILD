pkgname=btfs-git
pkgver=v2.24.r3.g3210332
pkgrel=2
pkgdesc="bittorrent filesystem"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/johang/btfs"
license=('GPL')
depends=('fuse' 'libtorrent-rasterbar' 'curl' 'boost')
makedepends=('git')
conflicts=('btfs')
provides=('btfs')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://github.com/johang/btfs.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
