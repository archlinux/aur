# Maintainer: Rafael Zichia <rafael@paemuri.com>

pkgname=ttfe
pkgver=2.0.0
pkgrel=1
pkgdesc='2048 game in the terminal'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~paemuri/ttfe'
license=('AGPL-3.0-or-later')
makedepends=('git' 'hare')
options=('!debug')
source=("git+https://git.sr.ht/~paemuri/ttfe#tag=v$pkgver")
sha256sums=('9542dfd8a9447b3993d015d7d45338cee60764c56c8a1043a6eb89db65d697e6')

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
  install -Dm0644 LICENSES/AGPL-3.0-or-later.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
