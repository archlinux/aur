# Maintainer: zimbatm <zimbatm@zimbatm.com>
# Maintainer: ShadowKyogre <shadowkyogre.public+aur@gmail.com>
# Maintainer: rmorgans <rick.morgans@gmail.com>
pkgname=direnv
pkgver=2.21.0
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686' 'armv7h')
url='https://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/direnv/direnv/archive/v$pkgver.tar.gz")
sha256sums=('0dd3c28c43bf411a70d65bc34f91dfe59f772b99816b999ab6481eb64b2a8573')

_gopackagepath=github.com/direnv/direnv

prepare() {
  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh
  export GOPATH="$srcdir/go"

  mkdir -p "$GOPATH/src/$(dirname "$_gopackagepath")"
  mv "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_gopackagepath"
}

build() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/$_gopackagepath"
  make
}

package() {
  export GOPATH="$srcdir/go"
  cd "$GOPATH/src/$_gopackagepath"
  make install DESTDIR="$pkgdir/usr"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
