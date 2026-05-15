# Maintainer: prayjofir <210920094+prayjofir@users.noreply.github.com>
# Description: 🚀 Terminalde Türkçe altyazılı anime arama ve izleme aracı
pkgname=anitr-cli-git
pkgver=r0.main
pkgrel=1
pkgdesc="🚀 Terminalde Türkçe altyazılı anime arama ve izleme aracı"
arch=('x86_64' 'aarch64')
url="https://github.com/prayjofir/anitr-cli"
license=('GPL3')
depends=('mpv')
makedepends=('go' 'git')

optdepends=(
  'rofi: X11 kullanıcıları için GUI'
  'rofi-wayland: Wayland kullanıcıları için GUI'
  'yt-dlp: Anime indirme özelliği için'
)

provides=('anitr-cli')
conflicts=('anitr-cli')

source=("${pkgname}::git+https://github.com/prayjofir/anitr-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  export GOFLAGS="-mod=mod"
  export CGO_ENABLED=0
  go mod tidy
  go build -o build/anitr-cli \
    -ldflags="-s -w"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/anitr-cli "$pkgdir/usr/bin/anitr-cli"
}
