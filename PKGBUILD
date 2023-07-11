# Maintainer: Sieve Lau <sievelau@gmail.com>

pkgname=danmakufactory-git
pkgver=r44.1059a22
pkgrel=1
pkgdesc='A tool for converting XML danmaku to ass subtitles.'
url="https://github.com/hihkm/DanmakuFactory"
arch=(x86_64)
provides=(danmakufactory)
conflicts=(danmakufactory)
license=(MIT)
source=(
  "${pkgname%-git}::git+https://github.com/hihkm/DanmakuFactory.git"
)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/${pkgname%-git}
  (
    set -o pipefail
    git describe --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 DanmakuFactory $pkgdir/usr/bin/DanmakuFactory
}
