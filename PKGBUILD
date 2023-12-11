# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>
# -*- sh -*-

pkgname='littlefs-fuse'
pkgver=2.7.3
pkgrel=1
pkgdesc="A FUSE wrapper that puts the littlefs in user-space"
url="https://github.com/littlefs-project/littlefs-fuse"
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
  '7bf46fca2bb5b498f7a21786cc16573ec9e3915b92463492b4efa3958b690723'
)
b2sums=(
  'dcdf191ce6d2c8f0a487e2ba8ddff3eb089fcacee2cfeaaa46b6e289d5196d18d7aef5c09740d82a7e5e797e17aeb604435bc5beb736e1c32be5b60f4b3cba7c'
)

# 🪷 Beyond the Known — 365 Days of Exploration
#
# 📆 11th December
#
# Only here for an instant, fully expressing itself, and never
# to be seen again in the same way.
#
# 🔗 https://magnetic-ink.dk/users/btk

# eof
