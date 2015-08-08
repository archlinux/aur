# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Ionut Biru <ionut@archlinux.ro>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>

pkgname=silc-toolkit
pkgver=1.1.12
pkgrel=1
pkgdesc="Toolkit for Secure Internet Live Conferencing"
url="http://silcnet.org"
license=(GPL2)
arch=(i686 x86_64)
depends=('libidn' 'perl')
source=("https://downloads.sourceforge.net/project/silc/silc/toolkit/sources/$pkgname-$pkgver.tar.gz")
sha512sums=('21393e9e7880670550e2325aa2eeda65a802bca87888b6d807ebed3a86844428b2a99f7434e6208ff61308df3767a12dd5d047dc546197bb78782811cf2b5e60')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -if
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr                       \
    --sysconfdir=/etc                   \
    --with-simdir=/usr/lib/silc/modules \
    --enable-ipv6                       ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # remove 26 MB of developer-oriented documentation
  #rm -rf "$pkgdir"/usr/share/doc/$pkgname/toolkit
}

# vim: ts=2:sw=2:et:nowrap
