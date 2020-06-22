# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=quickmedia-git
pkgver=r132.baed3cd
pkgrel=1
pkgdesc='A native client for web media. Works with youtube, 4chan and several manga sites.'
arch=('x86_64')
url="https://git.dec05eba.com/QuickMedia"
license=('GPL3')
depends=('sfml' 'libx11' 'jsoncpp' 'cppcodec' 'tidy')
provides=('QuickMedia')
conflicts=('QuickMedia')
source=("git+https://git.dec05eba.com/QuickMedia")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/QuickMedia"
  printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/QuickMedia"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/QuickMedia"
  sibs build --release
}

package() {
  cd "$srcdir/QuickMedia"
  install -Dm755 "sibs-build/$(sibs platform)/release/QuickMedia" "$pkgdir/usr/bin/QuickMedia"
  install -Dm644 boards.json "$pkgdir/usr/share/quickmedia/boards.json"
  for file in fonts/* images/*; do
    install -Dm644 "$file" "$pkgdir/usr/share/quickmedia/$file"
  done
}
