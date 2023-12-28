# Maintainer: Jamie King <git@ironveil.cloud>
pkgname=ttf-dm-fonts-git
_pkgname=ttf-dm-fonts

pkgver=5.003r45.da9bd90
pkgrel=1
pkgdesc="A set of fonts commissioned from Colophon Foundry for the DeepMind team."
arch=("any")
url="https://github.com/googlefonts/dm-fonts"
license=("SIL")
depends=(fontconfig)
makedepends=("git")
source=("git+https://github.com/googlefonts/dm-fonts.git")
md5sums=("SKIP")
provides=("ttf-dm-fonts")
conflicts=("ttf-dm-fonts")

pkgver() {
    cd "$srcdir/dm-fonts"
    printf "5.003r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dm-fonts"
  install -d -m755 "$pkgdir/usr/share/licenses/$_pkgname"
  install -D -m644 README.md "$pkgdir/usr/share/licenses/$_pkgname/README.md"
  install -D -m644 AUTHORS.txt "$pkgdir/usr/share/licenses/$_pkgname/AUTHORS.txt"
  install -D -m644 CONTRIBUTORS.txt "$pkgdir/usr/share/licenses/$_pkgname/CONTRIBUTORS.txt"

  install -d -m755 "$pkgdir/usr/share/fonts/dm-sans"
  install -D -m644 Sans/Exports/*.ttf "$pkgdir/usr/share/fonts/dm-sans"

  install -d -m755 "$pkgdir/usr/share/fonts/dm-serif"
  install -D -m644 Serif/Exports/*.ttf "$pkgdir/usr/share/fonts/dm-serif"
}
