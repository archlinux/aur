# Maintainer: Clemens Brunner < clemens dot brunner at gmail dot com >
pkgname=rstudio-desktop-bin
pkgver=2026.06.0.242
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=2
pkgdesc="An integrated development environment (IDE) for R (binary from RStudio official repository)"
arch=('x86_64')
license=('AGPL-3.0-or-later')
url="https://posit.co/products/open-source/rstudio/"
depends=('r>=3.3.0' 'sqlite' 'libxkbcommon')
optdepends=('clang: C/C++ and Rcpp code completion'
            'ttf-dejavu: fallback font support')
conflicts=('rstudio-desktop' 'rstudio-desktop-git' 'rstudio-desktop-preview-bin')
provides=("rstudio-desktop=${pkgver}")
options=(!strip)

sha256sums_x86_64=('885fb9f2dc6d8fb49d57b1111bc735b2e2b8e254fa7a50224e389c1dfc586008')

source_x86_64=("https://download1.rstudio.org/electron/jammy/amd64/rstudio-${_pkgver}-amd64.deb")

package() {
  cd "$srcdir"
  tar Jxpf data.tar.xz -C "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"

  ln -s /usr/lib/rstudio/rstudio "$pkgdir/usr/bin/rstudio"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/lib/rstudio/resources/app/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
