# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=ninfod
pkgver=s20100412.r5.g62f7f09
pkgrel=1
pkgdesc='Daemon for IPv6 Node Information Queries (RFC4620)'
arch=(i686 x86_64)
source=("git://git.linux-ipv6.org/gitroot/ninfod.git"
        "ninfod.service")
sha256sums=('SKIP'
            'f2614737bd7b4c521f3cccc2b30594f3d3a48a6cc8360666e12bdbf6a9328e48')

pkgver() {
  cd "$pkgname"
  git describe | sed 's/-/.r/; s/-/./g'
}

prepare() {
  cd "$pkgname"
  ./autogen
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr --sbindir=/usr/lib/$pkgname
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm0644 "ninfod.service" "$pkgdir/usr/lib/systemd/system/ninfod.service"
}

# vim: ts=2:sw=2:et
