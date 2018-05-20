# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=pakku
pkgver=0.12
pkgrel=1
pkgdesc='Pacman wrapper with AUR support'
arch=('x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libcurl.so' 'git')
makedepends=('nim')
backup=('etc/pakku.conf')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('73dc0da6bb36a9aa211b2e562d08d6cc60ab37ed527348f5d075df7aeac0e35c')

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
