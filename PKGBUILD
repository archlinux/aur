# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=fabother-world
pkgname=$_pkgbase-git
pkgver=r84.dea6914
pkgrel=1
pkgdesc='An interpreter for Another World (Out of this world)'
arch=('i686' 'x86_64')
url="http://fabiensanglard.net/anotherWorld_code_review/"
license=('GPL2')
depends=('sh' 'sdl' 'zlib')
makedepends=('git' 'cmake')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/fabiensanglard/Another-World-Bytecode-Interpreter.git"
        "$_pkgbase.sh" "$_pkgbase.png" "$_pkgbase.desktop")
sha256sums=('SKIP'
            'ef2791fdc1c9c6ad4ae4defaf62f9b0f59711c67c23078d50697a116eede71f5'
            'b57c493f1ae135ebc2b809211db091957fa0a7b755856ef1637e58cdd7dd216e'
            '5a28c3275fc006e802817caab6bab0b10da6c95422213f6aed0185a01d792a3a')

pkgver() {
  cd $_pkgbase
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgbase
	cmake .
  make
}

package() {
  cd $_pkgbase

  # launcher + binary
  install -Dm755 ../$_pkgbase.sh "$pkgdir"/usr/bin/$_pkgbase
  install -Dm755 raw "$pkgdir"/usr/share/$_pkgbase/$_pkgbase
  # docs
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgbase/README.md
  tail -n 200 src/main.cpp > "$pkgdir"/usr/share/doc/$_pkgbase/implementation.txt
  # desktop entry
  install -Dm644 ../$_pkgbase.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
