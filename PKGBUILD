# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=pakku
pkgver=0.8
pkgrel=1
pkgdesc='Pacman wrapper with AUR support'
arch=('x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libcurl.so' 'git')
makedepends=('nim')
backup=('etc/pakku.conf')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('1cddf9bcd719780873aa878566642295ce213f3443c7f3b2f573406673cfeb98')

build() {
  local addargs=()
  grep -Fxq debug <<< "`printf '%s\n' "${options[@]}"`" &&
  addargs=(NIM_TARGET='debug' NIM_OPTIMIZE='none')

  cd "$srcdir/$pkgname-$pkgver"
  make "${addargs[@]}" NIM_CACHE_DIR='../nimcache' PREFIX='/usr'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX='/usr' DESTDIR="$pkgdir" install
}
