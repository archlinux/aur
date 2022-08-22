# Maintainer : Axel Navarro <navarroaxel gmail>
_pkgname=googerteller
pkgname=$_pkgname-git
pkgver=r11.9cb01ff
pkgrel=1
pkgdesc='Audible feedback on just how much your browsing feeds into Google'
arch=('x86_64')
url="https://github.com/berthubert/$_pkgname"
license=('MIT')
depends=(pcaudiolib tcpdump)
makedepends=(cmake git)
conflicts=(googerteller)
conflicts=(googerteller)
source=("$_pkgname"::"git+https://github.com/berthubert/$_pkgname.git"
        googerteller.sh)
sha256sums=('SKIP'
            'ccfb1eaafed1f9d71d29f745d3d82c37348c36eab13c21bb5e494dda51bfd985')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cmake .
  make
}

package() {
  install -Dm755 googerteller.sh "$pkgdir/usr/bin/$_pkgname"

  cd "$_pkgname"
  install -Dm755 teller -t "$pkgdir/usr/lib/$_pkgname"
  install -Dm644 goog-prefixes.txt -t "$pkgdir/usr/lib/$_pkgname"
}
