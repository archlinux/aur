# Maintainer: Rafael Escobar <rafael@paemuri.com>

pkgname=ttfe
pkgver=1.0.0
pkgrel=1
pkgdesc='2048 game in the terminal'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~paemuri/ttfe'
license=('Unlicense')
makedepends=('git' 'hare')
options=('!debug')
source=("git+https://git.sr.ht/~paemuri/ttfe#tag=v$pkgver")
sha256sums=('54b1b9e52a11cad6e339dc5764e8900715e5c22a0c4a7ecfbe79710d2408fc58')

build() {
  cd "$pkgname"
  # Keeps Hare's build cache out of the home directory.
  export HARECACHE="$srcdir/hare-cache"
  hare build -R -o "$pkgname" .
}

check() {
  cd "$pkgname"
  export HARECACHE="$srcdir/hare-cache"
  hare test .
}

package() {
  cd "$pkgname"
  # -s because makepkg only removes debug info from static binaries, not the
  # symbols.
  install -Dm0755 -s -t "$pkgdir/usr/bin/" "$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
