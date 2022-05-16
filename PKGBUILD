# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Polis Minus <polisminus2247@tuta.io>
pkgname=activate-linux-wayland-git
_pkgname=activate-linux
pkgver=r4.d3bc7ea
pkgrel=1
pkgdesc="The \"Activate Windows\" watermark for Wayland"
arch=("x86_64")

url='https://github.com/Kljunas2/activate-linux.git'
makedepends=('git' 'make' 'clang')
depends=('gtk3' 'gtk-layer-shell')
license=('custom')
sha512sums=('SKIP'
            '76af63a9377cf75d1f2db368032029700747f2c9d7284cbdea6f562d873bd0d6e9122bbd695b88ff753e6bbc45a7c54a9b2554133d4b3825ce9f43228f39a37b')

source=(git+https://github.com/Kljunas2/activate-linux activate-linux.desktop)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  install -D activate-linux.desktop "$pkgdir/usr/share/applications/activate-linux.desktop"
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D bin/activate-linux "$pkgdir/usr/bin/activate-linux"
}

