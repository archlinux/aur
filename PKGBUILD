# Maintainer: budRich

pkgname=pacman.c-git
_pkgname=pacman.c
pkgver=0.r133.7bdeed9
pkgrel=2
pkgdesc='A Pacman clone written in C99'
arch=('any')
url='https://github.com/floooh/pacman.c'
license=('MIT')
makedepends=('cmake' 'alsa-lib' 'mesa' 'libx11')
source=("ghost.svg"
        "ICON-LICENSE"
        "pacman.c.desktop"
        "${_pkgname}::git+$url")
sha256sums=(47824cf3764f4ca8cee0e284bff2196b3b002a9070b91c1471e83b1d0e9f3863
            11859bc357155955b4ecade235e58269832258ad355eaf4673c7705a5de6c9ae
            876432a5d829a7bb167d4ef1ab0891320a76f462ad891317702f91c67eedaa91
            SKIP)
            

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  mkdir build
  cd build
  cmake ..
  cmake --build .
}

package() {
  cd "${_pkgname}"

  install -Dm755 build/pacman "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" "$srcdir/ICON-LICENSE"   LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname"                     README.md
  install -Dm755 -t "$pkgdir/usr/share/applications/"                     "$srcdir/$_pkgname.desktop"
  install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"      "$srcdir/ghost.svg"
}
