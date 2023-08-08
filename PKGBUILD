# Maintainer: Sieve Lau <sievelau@gmail.com>
# Contributor: Hafeoz <hafeoz@kolabnow.com>

pkgname=danmakufactory
pkgver=v1.70
pkgrel=1
pkgdesc='A tool for converting XML danmaku to ass subtitles.'
url="https://github.com/hihkm/DanmakuFactory"
arch=(x86_64)
license=(MIT)
makedepends=()
source=(
  "${pkgname}::git+https://github.com/hihkm/DanmakuFactory.git#tag=${pkgver}"
)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/${pkgname}
  (
    set -o pipefail
    git describe --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/${pkgname}"
  make
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 DanmakuFactory $pkgdir/usr/bin/DanmakuFactory
}
