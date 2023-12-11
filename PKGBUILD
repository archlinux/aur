# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>
# -*- sh -*-

pkgname='littlefs-fuse'
pkgver=2.4.0
pkgrel=2
pkgdesc='A FUSE wrapper that puts the littlefs in user-space'
url='https://github.com/littlefs-project/littlefs-fuse'
arch=('aarch64' 'x86_64')
license=('BSD')
depends=('fuse2' 'glibc')
options=('lto')
source=("littefs-$pkgver.tar.gz::https://github.com/littlefs-project/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('219d6e44c3925cbd25118c306f2c1f048a7119173ca0e1ac1752f20099ddf06d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Make sure the binary has “FULL RELRO”:
  sed -i '/^ifdef DEBUG/i override CFLAGS += $(LDFLAGS)' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 lfs        "$pkgdir/usr/bin/lfs"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm0644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
