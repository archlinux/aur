pkgname=usbimager-git
pkgver=1.0.4.r0.g1cfeeb8
pkgrel=1
pkgdesc="USBImager is a really really simple GUI application that writes compressed disk images to USB drives and creates backups."
arch=('i686' 'x86_64' 'armv7h')
url="https://gitlab.com/bztsrc/usbimager"
license=('MIT')
depends=('libx11' 'libxdmcp' 'libxcb')
makedepends=('git')
conflicts=('usbimager')
provides=('usbimager')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=("$pkgname"::'git+https://gitlab.com/bztsrc/usbimager.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/src"
  make
}

package() {
  cd "$srcdir/$pkgname/src"
  mkdir -p $pkgdir/usr/bin
  make PREFIX=/usr DESTDIR=$pkgdir install
}
