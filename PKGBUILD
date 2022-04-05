# Maintainer: sashok724 <archlinux at sashok724 dot net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Pavel Borzenkov <pavel@voidptr.ru>

_pkgname=criu
pkgname=criu-git
pkgver=r10915.5b2e5855c
pkgrel=1
pkgdesc="Utilities to checkpoint and restore processes in userspace, git version"
url='https://github.com/checkpoint-restore/criu'
license=('GPL2')
arch=('x86_64')
provides=('criu')
conflicts=('criu')
source=("git+$url")
depends=('libbsd' 'libnet' 'libnl' 'protobuf-c' 'python-protobuf' 'gnutls' 'nftables')
makedepends=('xmlto' 'asciidoc' 'git')
options=('!buildflags' '!lto')
sha256sums=(SKIP)

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
  make DESTDIR="$pkgdir" \
    PREFIX=/usr \
    SBINDIR=/usr/bin \
    LIBDIR=/usr/lib \
    LIBEXECDIR=/usr/lib \
    install

  # remove empty directory
  rmdir "$pkgdir/usr/include/compel/common/asm"
}
