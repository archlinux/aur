# Maintainer: zimbatm <zimbatm@zimbatm.com>
# Maintainer: ShadowKyogre <shadowkyogre.public+aur@gmail.com>
# Maintainer: rmorgans <rick.morgans@gmail.com>
pkgname=direnv
pkgver=2.21.3
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686' 'armv7h')
url='https://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/direnv/direnv/archive/v$pkgver.tar.gz")
sha256sums=('012651a79e47150de4a386d1c3c81a017d5ceac14f5a0c24b0596a2215cde8be')

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
