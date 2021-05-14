# Contributor: aksr <aksr at t-com dot me>
# Contributor: Pavel Borzenkov <pavel@voidptr.ru>
# Maintainer: sashok724 <archlinux at sashok724 dot net>

_pkgname=criu
pkgname=criu-git
pkgver=r10517.38012e535
pkgrel=1
pkgdesc="A Checkpoint/Restore functionality for Linux in Userspace, git version"
arch=('x86_64')
url='https://github.com/checkpoint-restore/criu'
license=('GPL2')
provides=('criu')
conflicts=('criu')
depends=('protobuf-c' 'libnl' 'libnet' 'python' 'python-protobuf')
makedepends=('xmlto' 'asciidoc' 'git')
source=("git+$url")
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" \
       PREFIX=/usr \
       SBINDIR=/usr/bin \
       LOGROTATEDIR=/etc/logrotate.d \
       LIBDIR=/usr/lib install
}
