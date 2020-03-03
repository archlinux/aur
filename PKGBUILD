# Maintainer: 4679kun <admin@libnull.com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=nougat-git
_pkgname=nougat
pkgver=r100.a67aaac
pkgrel=1
pkgdesc='Screenshot wrapper'
arch=(any)
url='https://github.com/Sweets/nougat'
license=('MIT')
optdepends=(
  'maim: Maim backend support'
  'imagemagick: ImageMagick backend support'
  'slop: ImageMagick backend support'
  'scrot: Scrot backend support'
  'xclip: Clipboard support'
  'xorg-xrandr: Screenshot focused monitor'
  'xdotool: Screenshot focused monitor'
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

build() {
    cd "$srcdir/${_pkgname}"
    make
}

package() {
  install -Dm755 "$srcdir"/$_pkgname/build/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir"/$_pkgname/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/$_pkgname/nougat.1" "$pkgdir/usr/share/man/man1/nougat.1"
}
