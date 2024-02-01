# Maintainer: chaewon <64337177+authorisation@users.noreply.github.com>

pkgname=achilles-git
pkgver=r47.b027477
pkgrel=1
pkgdesc="Achilles is a checkm8 utility for macOS and Linux that offers a selection of tools for vulnerable devices."
arch=(x86_64)
url="https://github.com/alfiecg24/Achilles"
license=('MIT')
groups=()
depends=('libimobiledevice-git' 'libusbmuxd-git')
makedepends=('git')
provides=(achilles)
source=("git+https://github.com/alfiecg24/Achilles" "0001-chore-lowercase-achilles-bin.patch")
md5sums=('SKIP'
         '22dcce17c5eebed40712bdac9ed0b275')

prepare() {
    cd Achilles

    patch --forward --strip=1 --input="${srcdir}/0001-chore-lowercase-achilles-bin.patch"
}

function pkgver() {
  cd Achilles

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Achilles

  make
}

package() {
  cd Achilles

  make DESTDIR="$pkgdir" install
}
