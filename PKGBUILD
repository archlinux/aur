# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=ninfod
pkgver=s20100412.r5.g62f7f09
pkgrel=1
pkgdesc='Daemon for IPv6 Node Information Queries (RFC4620)'
arch=(i686 x86_64)
source=("git://git.linux-ipv6.org/gitroot/ninfod.git"
        "ninfod.service"
        "ninfod.tmpfiles")
sha256sums=('SKIP'
            '9e19e9b36e69697a9f54338b7cc903312819537ebea39883aa8653074a89b5f5'
            '27cc2764953172f01188ee63fc9aa5923037e654a7213c53614bb65efefc1678')
install=$pkgname.install

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
  install -Dm0644 "ninfod.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ninfod.conf"
}

# vim: ts=2:sw=2:et
