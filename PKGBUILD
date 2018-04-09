# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=nougat-git
_pkgname=nougat
pkgver=r66.a431327
pkgrel=1
pkgdesc='Screenshot wrapper'
arch=(any)
url='https://github.com/Sweets/nougat'
license=('MIT')
optdepends=(
  'maim: Maim backend support'
  'imagemagick: ImageMagick backend support'
  'slop: ImageMagick backend support'
  'xclip: Clipboard support'
)
provides=('nougat')
conflicts=('nougat')

source=(
  "nougat::git+https://github.com/Sweets/nougat.git"
)

sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g'
  )
}

package() {
  install -Dm755 "$srcdir"/$_pkgname/${_pkgname}.sh "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir"/$_pkgname/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/$_pkgname/nougat.1" "$pkgdir/usr/share/man/man1/nougat.1"
}
