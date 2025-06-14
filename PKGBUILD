# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=bdsync
pkgver=0.11.4
pkgrel=1
pkgdesc="Fast block device synchronizing tool"
arch=("i686" "x86_64")
url="https://github.com/rolffokkens/bdsync"
license=('GPL-2.0-only')
depends=("openssl")
makedepends=("git" "pandoc")
source=("git+https://github.com/rolffokkens/$pkgname#tag=v${pkgver}")
sha256sums=('b4383e4a866ca6eae4dbb5e219461100b32d41dc3035faeb9d258e58fbdce57e')


prepare() {
  cd "$pkgname"
  sed -i -r \
    -e 's|^CFLAGS=(.*)|CFLAGS?=\1|' \
    -e 's|\$\(CRYPTO_LDFLAGS\)|\0 $(LDFLAGS)|' \
    Makefile
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 bdsync -t "$pkgdir/usr/bin"
  install -Dm644 bdsync.1 -t "$pkgdir/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
