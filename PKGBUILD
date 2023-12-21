# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>
# -*- sh -*-

pkgname='littlefs-fuse'
pkgver=2.7.4
pkgrel=1
pkgdesc='A FUSE wrapper that puts the littlefs in user-space'
url='https://github.com/littlefs-project/littlefs-fuse'
arch=('aarch64' 'x86_64')
license=('BSD')
depends=('fuse2' 'glibc')
options=('lto')
source=("littefs-$pkgver.tar.gz::https://github.com/littlefs-project/${pkgname}/archive/v${pkgver}.tar.gz")

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

sha256sums=(
  '84eae9b6c3841baf7772d3a9157d58060db9e3a41ae1c563122ccbc067d9d875'
)
b2sums=(
  '5f75dbc5e0ceb57a02fd197309c03bd8c2b5302cd806133e0d396d1e42542a4ca4257bc26d57181e7a1928457e9d3714c89d6ed3036325ea806f258059b9031d'
)

# eof
