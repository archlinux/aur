# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=pakku
pkgver=0.5
pkgrel=1
pkgdesc='Pacman wrapper with AUR support'
arch=('x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libcurl.so' 'git')
makedepends=('nim')
backup=('etc/pakku.conf')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('10ad9b1c100494daf202c7623111b28da261b930f94f9c35969f1b6a6aeee157')

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
