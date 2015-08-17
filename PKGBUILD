# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=spiffy-git
pkgver=20150818.r11.3b66e66
pkgrel=1
pkgdesc="spiffy builds a binary spiffs image for you to write_flash to a esp8266 runing nodemcu so you can get all the files onto your cool IoT device in one fell swoop. (git-version)"

arch=('any')
url="https://github.com/xlfe/spiffy"
license=('unknown')

depends=(
)
optdepends=(
)
makedepends=(
  'cmake'
  'gcc'
  'git'
)
conflicts=(
)

source=(
  "${pkgname%-git}::git+${url}.git#branch=master"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  mkdir -p build
  make
}

package() {
  cd "${pkgname%-git}/build"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
